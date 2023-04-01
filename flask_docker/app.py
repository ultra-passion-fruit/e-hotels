from flask import Flask, request, jsonify, render_template, redirect, url_for
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
    return render_template('sign-in-roles.html')

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
        
        # takes only the data we want from 'records'
        if len(response['records']) == 1:
            return render_template('search.html')
    ## Gotta fix this
    except botocore.exceptions as error:
        print(error.response)
        return render_template('sign-in-customer.html', error_message='Incorrect ID or password ')
    
    return render_template('sign-in-roles.html')

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