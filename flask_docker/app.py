from flask import Flask, request, jsonify, render_template, redirect, url_for, session, flash
import os
import boto3
from botocore.config import Config
import botocore

app=Flask(__name__, template_folder='templates')

my_config = Config(
    region_name = 'us-east-1'
)

rds_data = boto3.client('rds-data', config=my_config, aws_access_key_id=os.environ['AWS_ACCESS_KEY_ID'], aws_secret_access_key=os.environ['AWS_SECRET_KEY'])

#Database Configuration Items
aurora_db_name = os.environ['DB_NAME']
aurora_cluster_arn = os.environ['CLUSTER_ARN']
aurora_secret_arn = os.environ['SECRET_ARN']

# User session information
app.config['SECRET_KEY'] = '6a8733d1-daa2-4527-88a8-2d482507ad33'

def callDbWithStatement(statement):
    response = rds_data.execute_statement(
            database = aurora_db_name,
            resourceArn = aurora_cluster_arn,
            secretArn = aurora_secret_arn,
            sql = statement,
            includeResultMetadata = True
        )
    print("Making Call " + statement)
    print(response) #Delete this in production
    return response

@app.route('/') # API 1 - getHotelChains
def index():
    session.clear()
    try:
        # returns a long json with data and metadata
        response = callDbWithStatement("SELECT * FROM HotelChain;")
        # takes only the data we want from 'records'
        hotelChains = response['records']
    except botocore.exceptions.ClientError as error:
        print(error.response)

    return render_template('chains.html', chains=hotelChains)

@app.route('/signin', methods=['GET'])
def sign_in():
    role = request.args.get('role')
    print(role)
    if role == 'customer':
        return render_template('sign-in-customer.html')
    elif role == 'employee':
        return render_template('sign-in-employee.html')
    
    return render_template('sign-in-roles.html')

@app.route('/signin', methods=['POST'])
def authenticate():
    role = request.form['role']
    print(role)
    try:
        id = request.form['id']
        password = request.form['password']
        
        if role == 'customer':
            response = callDbWithStatement("SELECT * FROM Customer where cust_ID = '"+ id +"' and password ='"+ password +"';")
        elif role == 'employee':
            response = callDbWithStatement("SELECT * FROM Employee where emp_ID = '"+ id +"' and password ='"+ password +"';")
        
        # 1 entry was found in the database. This means the user exists and is authenticated.
        if len(response['records']) == 1:
            session['id'] = id
            session['role'] = role
            if role == 'customer':
                return redirect(url_for('home'))
            elif role == 'employee':
                return redirect(url_for('display_employee_homepage'))
        elif len(response['records']) == 0:
            if role == 'customer':
                return render_template('sign-in-customer.html', error=True, errorMessage='The Customer ID or Password is incorrect')
            elif role == 'employee':
                return render_template('sign-in-employee.html', error=True, errorMessage='The Employee ID or Password is incorrect')
    ## Gotta fix this
    except botocore.exceptions as error:
        print(error.response)
        return render_template('sign-in-customer.html', error=True, error_message='Incorrect ID or password ')
    
    return render_template('sign-in-roles.html')

@app.route('/home', methods=['GET'])
def home():
    if 'id' in session and 'role' in session:
        id = session['id']
        role = session['role']

        try:
            
            response = callDbWithStatement("SELECT * FROM available_rooms_per_city;")


            available_rooms = response['records']



 
            

        except botocore.exceptions.ClientError as error:
            print(error.response)


        if role == 'customer':
            return render_template('search.html', available_rooms=available_rooms)
    return

@app.route('/account/bookings', methods=['GET'])
def view_account_bookings():
    if 'id' in session and 'role' in session:
        id = session['id']
        role = session['role']
        print(id)
        print(role)
        if role == 'customer':
            query = "select hotelNameAndRoom.name, bookingList.booking_date, bookingList.start_date, bookingList.end_date, bookingList.no_of_persons, bookingList.booking_no,  bookingList.status, bookingList.room_info_no from (select * from booking where cust_ID = '{}') as bookingList left join (select hotel.name, hotelCodeAndRoom.room_info_no from hotel, (select hotel_code, room_info_no from roominfo where roominfo.room_info_no in  (select room_info_no from booking)) as hotelCodeAndRoom where hotel.hotel_code=hotelCodeAndRoom.hotel_code) as hotelNameAndRoom on bookingList.room_info_no=hotelNameAndRoom.room_info_no;".format(id)
            response = callDbWithStatement(query)
            bookings = response['records']
            return render_template('customer-bookings.html', bookings=bookings)

@app.route('/account', methods=['GET'])
def account():
    if 'id' in session and 'role' in session:
        id = session['id']
        role = session['role']
        print(id)
        print(role)
        if role == 'customer':
            if len(session) == 10:
                return render_template('account.html', user=session)
            else:  
                response = callDbWithStatement("select f_name, l_name, ssn, number_street, city, state_prov, email, registration_date from customer where cust_id = " + id + ";")
                # records is a singleton list, so just take the only item (the 0th)
                info = response['records'][0]
                # make dictionnary to pass user info to jinja tempate
                user = {
                        'id':id,
                        'f_name' : info[0]['stringValue'],
                        'l_name' :  info[1]['stringValue'],
                        'ssn' :  info[2]['longValue'],
                        'number_street' :  info[3]['stringValue'],
                        'city' :  info[4]['stringValue'],
                        'state_prov' :  info[5]['stringValue'],
                        'email' :  info[6]['stringValue'],
                        'registration_date' :  info[7]['stringValue'],}
                # adds user info to the current session, for reference
                session.update(user)
                # renders page with user info
                return render_template('account.html', user=user)
    return redirect(url_for('sign_in'))

@app.route('/account/edit', methods=['GET'])
def view_account_edit():
    if 'id' in session and 'role' in session:
        id = session['id']
        role = session['role']
        print(id)
        print(role)
        if role == 'customer':
            return render_template('account-edit.html', user=session)
    return redirect(url_for('sign_in'))

@app.route('/account/edit', methods=['POST'])
def save_account_edit():
    if 'id' in session and 'role' in session:
        id = session['id']
        role = session['role']
        print(id)
        print(role)
        if role == 'customer':
            # Getting values from form
            f_name = request.form['f_name']
            l_name = request.form['l_name']
            ssn = request.form['ssn']
            number_street = request.form['number_street']
            city = request.form['city']
            state_prov = request.form['state_prov']
            email = request.form['email']

            # Updating values on databse
            query = "UPDATE Customer SET f_name = '{}', l_name = '{}', ssn = '{}', number_street = '{}', city = '{}', state_prov = '{}', email = '{}' WHERE cust_ID = '{}';".format(f_name, l_name, ssn, number_street, city, state_prov, email, id)
            callDbWithStatement(query)

            # Updating session info
            session['f_name'] = f_name
            session['l_name'] = l_name
            session['ssn'] = ssn
            session['number_street'] = number_street
            session['city'] = city
            session['state_prov'] = state_prov
            session['email'] = email

            return redirect(url_for('account'))
    return redirect(url_for('sign_in'))

@app.route('/account/edit/password', methods=['GET'])
def view_change_password():
    if 'id' in session and 'role' in session:
        return render_template('account-change-password.html')



############# EMPLOYEE BUSINESS #############

@app.route('/employee/console', methods=['GET'])
def display_employee_homepage():
    if 'id' in session and 'role' in session:
        id = session['id']
        role = session['role']        
        if role == 'employee':  
            return render_template('emp-admin-console.html')
    return

@app.route('/employee/account', methods=['GET'])
def emp_account():
    if 'id' in session and 'role' in session:
        id = session['id']
        role = session['role']        
        if role == 'employee':
            if len(session) == 12:
                return render_template('account.html', user=session)
            else:  
                response = callDbWithStatement("SELECT f_name, l_name, ssn, number_street, city, state_prov, email, hotel_chain_code, hotel_code FROM Employee WHERE emp_ID = " + id + ";")
                # records is a singleton list, so just take the only item (the 0th)
                info = response['records'][0]
                # same for the hotel chain info
                hotel_chain_code = info[7]['stringValue']
                response2 = callDbWithStatement("SELECT name FROM HotelChain WHERE hotel_chain_code = '"+hotel_chain_code+"';")
                hotel_chain = response2['records'][0][0]['stringValue']
                # same for the hotel info 
                hotel_code = str(info[8]['longValue'])
                response3 = callDbWithStatement("SELECT name FROM Hotel WHERE hotel_chain_code = '"+hotel_chain_code+"' AND hotel_code = "+hotel_code+";")
                hotel = response3['records'][0][0]['stringValue']
                # make dictionnary to pass user info to jinja tempate
                user = {'id' : id,
                        'f_name' : info[0]['stringValue'],
                        'l_name' : info[1]['stringValue'],
                        'ssn' : info[2]['longValue'],
                        'number_street' : info[3]['stringValue'],
                        'city' : info[4]['stringValue'],
                        'state_prov' : info[5]['stringValue'],
                        'email' : info[6]['stringValue'],
                        'hotel' : hotel,
                        'hotel_code' : hotel_code,
                        'hotel_chain' : hotel_chain,
                        'hotel_chain_code' : hotel_chain_code}
                # adds user info to the current session, for reference
                session.update(user)
                # renders page with user info
                return render_template('emp-account.html', user=user)
        return redirect(url_for('sign_in'))

@app.route('/employee/account/edit', methods=['GET'])
def emp_view_account_edit():
    if 'id' in session and 'role' in session:
        id = session['id']
        role = session['role']
        print(id)
        print(role)
        if role == 'employee':
            return render_template('emp-account-edit.html', user=session)
    return redirect(url_for('sign_in'))

@app.route('/employee/account/edit', methods=['POST'])
def emp_save_account_edit():
    if 'id' in session and 'role' in session:
        id = session['id']
        role = session['role']
        print(id)
        print(role)
        if role == 'employee':
            # Getting values from form
            f_name = request.form['f_name']
            l_name = request.form['l_name']
            ssn = request.form['ssn']
            number_street = request.form['number_street']
            city = request.form['city']
            state_prov = request.form['state_prov']
            email = request.form['email']

            # Updating values on databse
            query = "UPDATE Employee SET f_name = '{}', l_name = '{}', ssn = '{}', number_street = '{}', city = '{}', state_prov = '{}', email = '{}' WHERE emp_ID = '{}';".format(f_name, l_name, ssn, number_street, city, state_prov, email, id)
            callDbWithStatement(query)

            # Updating session info
            session['f_name'] = f_name
            session['l_name'] = l_name
            session['ssn'] = ssn
            session['number_street'] = number_street
            session['city'] = city
            session['state_prov'] = state_prov
            session['email'] = email

            return redirect(url_for('emp_account'))
    return redirect(url_for('sign_in'))

@app.route('/employee/account/edit/password', methods=['GET'])
def emp_view_change_password():
    if 'id' in session and 'role' in session:
        return render_template('emp-change-password.html')
    return redirect(url_for('sign_in'))

@app.route('/employee/cust-checkin')
def emp_view_cust_checkin():
    if 'id' in session and 'role' in session:
        return render_template('emp-customer-checkin.html', message=" ") # no error message
    return redirect(url_for('sign_in'))

@app.route('/employee/cust-checkin/booking_view', methods=['POST'])
def emp_search_booking():
    if 'id' in session and 'role' in session:
        try:
            booking_no = request.form.get('booking_no')
            print(booking_no)  # for testing
            response = callDbWithStatement("SELECT * FROM Booking JOIN RoomInfo USING (room_info_no) WHERE booking_no = '"+booking_no+"';")
            print("records: ", response['records'])
            if len(response['records']) == 1:
                data = response['records'][0]
                booking = {'bk_room_info_no' : data[0]['longValue'],
                           'bk_no' : data[1]['longValue'],
                            'bk_date' : data[2]['stringValue'],
                            'bk_start_date' : data[3]['stringValue'],
                            'bk_end_date' : data[4]['stringValue'],
                            'bk_no_of_persons' : data[5]['longValue'],
                            'bk_status' : data[6]['stringValue'],
                            'bk_cust_ID' : data[7]['longValue'],
                            'bk_hotel_chain_code' : data[8]['stringValue'],
                            'bk_hotel_code' : data[9]['longValue'],
                            'bk_room_no' : data[10]['longValue'],
                            'bk_capacity' : data[11]['longValue'],
                            'bk_price' : data[12]['longValue'],
                            'bk_view' : data[13]['stringValue'],
                            'bk_possible_extension' : data[14]['stringValue'],
                            'bk_description' : data[15]['stringValue'],
                            'bk_room_status' : data[16]['stringValue']}
                
                # checks if employee does work in that hotel
                emp_hotel_response = callDbWithStatement("SELECT hotel_chain_code, hotel_code FROM Employee WHERE emp_ID = '"+session['id']+"';")
                emp_hotel_data = emp_hotel_response['records'][0]
                emp_hotel_chain_code = emp_hotel_data[0]['stringValue']
                emp_hotel_code = emp_hotel_data[1]['longValue']
                if booking['bk_hotel_chain_code'] != emp_hotel_chain_code or booking['bk_hotel_code'] != emp_hotel_code:
                    return render_template('emp-customer-checkin.html', message="Sorry, you are not allowed to see this booking.")
                
                # loads customer name and email in the booking info
                cust_info_response = callDbWithStatement("SELECT f_name, l_name, email FROM Customer WHERE cust_ID = '"+str(booking['bk_cust_ID'])+"';")
                cust_info = cust_info_response['records'][0]
                booking['bk_cust_f_name'] = cust_info[0]['stringValue']
                booking['bk_cust_l_name'] = cust_info[1]['stringValue']
                booking['bk_cust_email'] = cust_info[2]['stringValue']

                session.update(booking)

                if booking['bk_status'] == 'Archived':
                    return render_template('emp-customer-booking-archived.html', booking=session, message=" ")

                return render_template('emp-customer-booking.html', booking=session)
            else: 
                return render_template('emp-customer-checkin.html', message="Sorry, there is no such booking.")
        except botocore.exceptions.ClientError as error:
            print(error.response)
    return

@app.route('/employee/cust-checkin/booking_confirmed', methods=['GET'])
def payment_confirmed():
    if 'id' in session and 'role' in session:
        try:
            response = callDbWithStatement("SELECT COALESCE(MAX(renting_no), 0) + 1 FROM Renting")
            print(response)
            new_rent_no = response['records'][0][0]['longValue']
            print("New rent no: ", new_rent_no)

            # inserts new entry into rent
            query = "INSERT INTO Renting VALUES ('{}', CAST( now() AS Date), '{}', '{}', '{}', 'In progress', '{}', '{}', '{}');".format(new_rent_no, session['bk_start_date'], session['bk_end_date'], session['bk_no_of_persons'], session['id'], session['bk_cust_ID'], session['bk_room_info_no'])
            callDbWithStatement(query)

            # inserts new entry into made_from (trigger will update booking status on this)
            query = "INSERT INTO MadeFrom VALUES ('{}', '{}');".format(new_rent_no, session['bk_no'])
            callDbWithStatement(query)

            session['bk_status'] = 'Archived'
            return render_template('emp-customer-booking-archived.html', booking=session, message="Rent successful")
        except botocore.exceptions.ClientError as error:
            print(error.response)
    return

#this is for booking
@app.route('/book', methods=['POST'])
def bookRoom():

    print('bookRoom')
    room_no = request.form['room_info_no']
    print(room_no)
    capacity = request.form['capacity']
    print(capacity)
    try:
            # Perform the search using the search parameters

            response = callDbWithStatement("SELECT COALESCE(MAX(booking_no), 0) FROM booking;")

            

            output = response['records'][0]
            
            id = output[0]['longValue'] + 1

            print(id)
            response = callDbWithStatement("INSERT into booking values( "+ str(id) +", CAST( now() AS Date), '"
            + session['checkin']+"', '"
            + session['checkout']+"' , " 
            + capacity + "," 
            + "'Not rented yet' ," 
            +str(session['id']) + "," +room_no + ")"
            )

            print("insert done")
            flash("Your Booking has been applied, please check 'My Booking' for more infomation")
            return redirect(url_for('home'))

    except botocore.exceptions.ClientError as error:
            print(error.response)
            flash("There's an error occur, please try again later")
            

    return redirect(url_for('home'))







@app.route('/home/searchHotel', methods=['post'])
def searchHotel():
   
        # Get the search parameters from the form


        if request.form['location'] is None:
            # location field is empty
            location = session['location']
        else:
            # location field is not empty
            location = request.form['location']
            session['location'] = location

        if request.form['checkin'] is None:
            
            checkin = session['checkin']
        else:
           
            checkin = request.form['checkin']
            session['checkin'] = checkin
        
        if request.form['checkout'] is None:
            
            checkout = session['checkout']
        else:
           
            checkout = request.form['checkout']
            session['checkout'] = checkout
            
        if request.form['capacity'] is None:
            
            capacity = session['capacity']
        else:
           
            capacity = request.form['capacity']
            session['capacity'] = capacity

        if request.form['chain'] is None:
            
            chain = session['chain']
        else:
           
            chain = request.form['chain']
            session['chain'] = chain
        
        
        if request.form['category'] is None:
            
            chain = session['category']
        else:
           
            category = request.form['category']
            session['category'] = category
        

        if request.form['number of rooms'] is None:
            
            num_rooms = session['number of rooms']
        else:
           
            num_rooms = request.form['number of rooms']
            session['number of rooms'] = num_rooms

        
        if request.form['Price'] is None:
            
            price = session['Price']
        else:
           
            price = request.form['Price']
            session['Price'] = price

        



        try:
            # Perform the search using the search parameters
            response = callDbWithStatement("select name,room_no, possible_extension,capacity,description,number_street, city, price, room_info_no  from(SELECT ri.* FROM RoomInfo ri WHERE ri.hotel_code IN (SELECT h.hotel_code FROM Hotel h WHERE h.city = '" + location
            +"' AND h.hotel_chain_code = '"+chain + "' AND h.rating = "+ category +") AND ri.capacity >= "+ capacity
            +"AND ri.price <= "+ price +"AND ri.status = 'Available' AND (SELECT COUNT(*)"
            +" FROM RoomInfo ri2 WHERE ri2.hotel_code = ri.hotel_code) = "+ num_rooms
            + "AND NOT EXISTS (SELECT 1 FROM Booking b WHERE b.room_info_no = ri.room_info_no and b.status = 'Not rented yet'"
            +" AND ((b.start_date <= '"+checkout+ "' AND b.end_date >= '"+checkin+"' )"
            +" OR (b.start_date >= '"+checkin+ "' AND b.end_date <= '"+checkout+"' )"
            +" OR (b.start_date <= '"+checkin+ "' AND b.end_date >= '"+checkin+"' )"
            +" OR (b.start_date <= '"+checkout+ "' AND b.end_date >= '"+checkout+"' )))) as T  join hotel using(hotel_code) order by price")


            rooms = response['records']

            print(response['records'])

 
            # Return the search results to the template
            return render_template('searchResult.html', rooms=rooms, checkin=checkin, checkout=checkout, capacity=capacity)

        except botocore.exceptions.ClientError as error:
            print(error.response)

        return redirect(url_for('home'))


@app.route('/home', methods=['GET'])
def view_search():
   
    return render_template('search.html')

@app.route('/signin', methods=['GET'])
def log_out():
    session.clear()
    return render_template('sign_in') 





if __name__ == '__main__':
    app.run(threaded=True,host='0.0.0.0',port=5000)