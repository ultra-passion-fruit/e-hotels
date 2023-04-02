from flask import Flask, request, jsonify, render_template, redirect, url_for, session
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
                response = callDbWithStatement("SELECT f_name, l_name FROM Employee WHERE emp_id = " + id + ";")
                # records is a singleton list, so just take the only item (the 0th)
                info = response['records'][0]
                # make dictionnary to pass user info to jinja tempate
                user = {'f_name' : info[0]['stringValue'],
                        'l_name' :  info[1]['stringValue']}
                return render_template('emp_homepage.html', user=user)
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
    return render_template('search.html')

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
                user = {'f_name' : info[0]['stringValue'],
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
        elif role == 'employee':
            
            # TODO: Employee version of user dictionnary

            return render_template('account.html')
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
        elif role == 'employee':
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
        elif role == 'employee':

            # TODO: Employee version of update

            return redirect(url_for('account'))
    return redirect(url_for('sign_in'))

# first try, to test, emp_ID hardcoded for testing
@app.route('/homepage_employee', methods=['GET'])
def displayEmployeeHomepage():
    try:
        # returns a long json with data and metadata
        response = callDbWithStatement("SELECT * FROM Employee WHERE emp_ID = 1000;")
        # takes only the data we want from 'records'
        data = response['records'][0]
        current_user_name = data[1]['stringValue'] + " " + data[2]['stringValue']
        return render_template('homepage_employee.html', user_name=current_user_name)

    except botocore.exceptions.ClientError as error:
        print(error.response)

if __name__ == '__main__':
    app.run(threaded=True,host='0.0.0.0',port=5000)