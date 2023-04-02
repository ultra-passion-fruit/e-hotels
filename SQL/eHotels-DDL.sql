/*
DROP TRIGGER IF EXISTS set_booking_archived ON MadeFrom;
DROP FUNCTION IF EXISTS set_booking_archived();

CREATE OR REPLACE FUNCTION set_booking_archived() RETURNS TRIGGER AS $$
BEGIN
    UPDATE Booking
    SET status = 'Archived'
    WHERE Booking.booking_no = NEW.booking_no;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_booking_archived
AFTER INSERT ON MadeFrom
FOR EACH ROW
EXECUTE FUNCTION set_booking_archived();



*/

/*

DROP TRIGGER IF EXISTS set_booking_archived;

drop table if exists madefrom;
drop table if exists renting;
drop table if exists booking;

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
phone_number CHAR(20),
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
phone_number CHAR(20),
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
phone_number CHAR(20),
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
phone_number CHAR(20),
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

-- ---------------------------------------------
create table if not exists Booking(
booking_no INTEGER PRIMARY KEY,
booking_date DATE NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
no_of_persons INTEGER NOT NULL,
status VARCHAR(14)NOT NULL,
CHECK (status IN ('Not rented yet', 'Cancelled', 'Archived')),
cust_ID INTEGER NOT NULL,
room_info_no INTEGER NOT NULL,
FOREIGN KEY (room_info_no) REFERENCES RoomInfo(room_info_no)
);

create table if not exists Renting(
renting_no INTEGER PRIMARY KEY,
checkin_date DATE NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
no_of_persons INTEGER NOT NULL,
status VARCHAR(11) NOT NULL,
CHECK (status IN ('In progress', 'Archived')),
emp_ID INTEGER,
FOREIGN KEY (emp_id) REFERENCES Employee(emp_ID),
cust_ID INTEGER,
FOREIGN KEY (cust_id) REFERENCES Customer(cust_ID),
room_info_no INTEGER,
FOREIGN KEY (room_info_no) REFERENCES RoomInfo(room_info_no)
);


create table if not exists MadeFrom(
renting_no INTEGER,
FOREIGN KEY (renting_no) REFERENCES Renting(renting_no),
booking_no INTEGER,
primary key (booking_no,renting_no),
FOREIGN KEY (booking_no) REFERENCES booking(booking_no)
);

-- MySQL TRIGGER
CREATE TRIGGER set_booking_archived
AFTER INSERT ON MadeFrom
FOR EACH ROW

    UPDATE Booking
    SET status = 'Archived'
    WHERE Booking.booking_no = NEW.booking_no;




CREATE VIEW available_rooms_per_city AS
SELECT h.city, COUNT(*) as num_available_rooms
FROM Hotel h
JOIN Room r ON h.hotel_chain_code = r.hotel_chain_code AND h.hotel_code = r.hotel_code
JOIN RoomInfo ri ON r.room_info_no = ri.room_info_no
WHERE ri.status = 'Available'
GROUP BY h.city;

DROP VIEW hotel_room_capacity;

CREATE VIEW hotel_room_capacity AS
SELECT h.hotel_code, h.name, ri.capacity AS room_capacity
FROM Hotel h
JOIN Room r ON h.hotel_chain_code = r.hotel_chain_code AND h.hotel_code = r.hotel_code
JOIN RoomInfo ri ON r.room_info_no = ri.room_info_no;








