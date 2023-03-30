from flask import Flask, request, jsonify, render_template
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

@app.route('/chains') # API 1 - getHotelChains
def getHotelChains():
    try:
        # returns a long json with data and metadata
        response = callDbWithStatement("SELECT * FROM HotelChain;")
        # takes only the data we want from 'records'
        hotelChains = response['records']
    except botocore.exceptions.ClientError as error:
        print(error.response)

    return render_template('chains.html', chains=hotelChains)
    
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

@app.route('/')
def index():
    return render_template('signinRoles.html')

@app.route('/selectLogInRoles', methods=['GET', 'POST'])
def selectLogInRoles():
    if request.method == 'POST':
        # Check if the form was submitted
        
        if request.form['login'] == 'Sign In C':
            # Redirect to the sign in page
            return render_template('signinC.html')
        elif request.form['login'] == 'Sign In E':
            return render_template('signinE.html')
    
    



@app.route('/CustomersSignIN', methods=['POST'])
def checkCustomerSignIN():
    try:
        cID = request.form['cID']
        cPassword = request.form['cPassword']
        # returns a long json with data and metadata
        response = callDbWithStatement("SELECT * FROM Customer where cust_ID = '"+cID +"' and password ='"+cPassword +"';")
        # takes only the data we want from 'records'

        if len(response['records']) == 1:
            return render_template('search.html', cID=cID)
    except botocore.exceptions.ClientError as error:
        print(error.response)
        return render_template('signinC.html', error_message='Incorrect Customers ID or password ')


@app.route('/EmployeeSignIN', methods=['POST'])
def checkEmployeeSignIN():
    try:
        eID = request.form['eID']
        ePassword = request.form['ePassword']
        # returns a long json with data and metadata
        response = callDbWithStatement("SELECT * FROM Employee where emp_ID = '"+eID +"' and password ='"+ePassword +"';")
        # takes only the data we want from 'records'

        if len(response['records']) == 1:
            return render_template('hotels.html', eID=eID)
    except botocore.exceptions.ClientError as error:
        print(error.response)
        return render_template('signinE.html', error_message="Incorrect Employee ID or password")

   


if __name__ == '__main__':
    app.run(threaded=True,host='0.0.0.0',port=5000)