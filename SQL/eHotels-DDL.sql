/*
drop table IF EXISTS amenity;
drop table IF EXISTS problem;
drop table IF EXISTS room;
drop table IF EXISTS roominfo;

drop table IF EXISTS customerphone;
drop table IF EXISTS customer;

drop table IF EXISTS employeephone;
drop table IF EXISTS employeeposition;
drop table IF EXISTS employee;

drop table IF EXISTS hotelphone;
drop table IF EXISTS hotel;

drop table IF EXISTS hotelchainphone;
drop table IF EXISTS hotelchainemail;
drop table IF EXISTS hotelchain;
*/
create table if not exists HotelChain(
hotel_chain_code CHAR(4) PRIMARY KEY,
name VARCHAR(50) NOT NULL,
num_of_hotels INTEGER NOT NULL,
hq_number_street VARCHAR(50) NOT NULL,
hq_city VARCHAR(50) NOT NULL,
hq_state_prov VARCHAR(50) NOT NULL,
hq_zip VARCHAR(6) NOT NULL
);

create table if not exists HotelChainPhone(
hotel_chain_code CHAR(4),
phone_number CHAR(11),
FOREIGN KEY(hotel_chain_code)REFERENCES HotelChain(hotel_chain_code) on delete cascade,
primary key (hotel_chain_code, phone_number)
);

create table if not exists HotelChainEmail(
hotel_chain_code CHAR(4),
email VARCHAR(50),
FOREIGN KEY(hotel_chain_code)REFERENCES HotelChain(hotel_chain_code) on delete cascade,
primary key(hotel_chain_code,email )
);


create table if not exists Hotel(
hotel_chain_code CHAR(4),
hotel_code INTEGER ,
name VARCHAR(50) NOT NULL,
manager_ID INTEGER NOT NULL,
rating INTEGER CHECK (rating BETWEEN 0 AND 5),
num_of_rooms INTEGER NOT NULL,
number_street VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
state_prov VARCHAR(50) NOT NULL,
zip VARCHAR(6) NOT NULL,
email VARCHAR(50) NOT NULL,
FOREIGN KEY (hotel_chain_code) REFERENCES HotelChain(hotel_chain_code) on delete cascade,
primary key(hotel_chain_code, hotel_code)
);

create table if not exists HotelPhone(
hotel_chain_code CHAR(4),
hotel_code INTEGER,
phone_number CHAR(11),
FOREIGN KEY(hotel_chain_code, hotel_code)REFERENCES Hotel(hotel_chain_code, hotel_code) on delete cascade,
primary key(hotel_chain_code, hotel_code, phone_number)
);

create table if not exists Employee(
emp_ID INTEGER PRIMARY KEY,
f_name VARCHAR(50) NOT NULL,
l_name VARCHAR(50) NOT NULL,
ssn INTEGER NOT NULL UNIQUE CHECK (ssn BETWEEN 0 AND 999999999),
number_street VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
state_prov VARCHAR(50) NOT NULL,
zip VARCHAR(6) NOT NULL,
email VARCHAR(50) NOT NULL,
hotel_chain_code CHAR(4) NOT NULL,
hotel_code INTEGER NOT NULL,
password varchar(20) not null,
FOREIGN KEY(hotel_chain_code, hotel_code) REFERENCES Hotel(hotel_chain_code, hotel_code)

);

create table if not exists EmployeePhone(
emp_ID INTEGER,
phone_number CHAR(11),
FOREIGN KEY (emp_id) REFERENCES Employee(emp_ID),
primary key (emp_ID, phone_number)
);

create table if not exists EmployeePosition(
emp_ID INTEGER ,
position VARCHAR(50),
FOREIGN KEY (emp_id) REFERENCES Employee(emp_ID),
primary key (emp_ID, position)
);


create table if not exists Customer(
cust_ID INTEGER PRIMARY KEY,
f_name VARCHAR(50) NOT NULL,
l_name VARCHAR(50) NOT NULL,
ssn INTEGER NOT NULL UNIQUE CHECK (ssn BETWEEN 0 AND 999999999),
number_street VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
state_prov VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,

registration_date timestamp NOT NULL,
password varchar(20) not null
);

create table if not exists CustomerPhone(
cust_ID INTEGER,
phone_number CHAR(11),
FOREIGN KEY(cust_ID)REFERENCES Customer(cust_ID),
primary key(cust_ID, phone_number)
);


create table if not exists RoomInfo(
room_info_no INTEGER PRIMARY KEY,
hotel_chain_code CHAR(4) NOT NULL,
hotel_code INTEGER NOT NULL,
room_no INTEGER NOT NULL,
capacity INTEGER NOT NULL,
price INTEGER NOT NULL,
view VARCHAR(50) CHECK (view IN('Mountain', 'Sea')),
possible_extension VARCHAR(50),
description VARCHAR(50),
status VARCHAR(50)NOT NULL,
CHECK (status IN ('Available', 'Occupied', 'In renovation', 'Deleted'))
);


create table if not exists Room(
hotel_chain_code CHAR(4),
hotel_code INTEGER,
room_no INTEGER,
room_info_no INTEGER,
FOREIGN KEY (room_info_no) REFERENCES RoomInfo(room_info_no),
FOREIGN KEY (hotel_chain_code, hotel_code) REFERENCES Hotel(hotel_chain_code, hotel_code),
primary key(hotel_chain_code, hotel_code,room_no)
);


create table if not exists Amenity(
room_info_no INTEGER,
amenity VARCHAR(50),
FOREIGN KEY (room_info_no) REFERENCES RoomInfo(room_info_no),
primary key(room_info_no, amenity)
);

create table if not exists Problem(
room_info_no INTEGER,
title VARCHAR(50),
description VARCHAR(50),
FOREIGN KEY (room_info_no) REFERENCES RoomInfo(room_info_no),
primary key (room_info_no, title)
);



