

insert into hotelchain values
					  ('HILN', 'Hilton Hotels', 8, '7930 Jones Branch Dr', 'McLean', 'Virginia', '22102'),
					  ('MARR', 'Marriott International', 8,'10400 Fernwood Road', 'Bethesda', 'Maryland', '20817'),
                      ('CHOI', 'Choice Hotels International', 8, '1 Choice Hotels Cir', 'Rockville', 'Maryland', '20850'),
                      ('IHGN', 'InterContinental Hotels Group', 8, '3 Ravinia Drive', 'Atlanta', 'Georgia','30346'),
                      ('HYAT', 'Hyatt Hotels Corporation', 8, '150 N Riverside Plaza', 'Chicago', 'Illinois', '60606');

-- 'HILN' -----------------------------------------------------------
-- manager_ID is set to -1, because there's no employee from now
insert into hotel values
					('HILN', 1001,	'Hilton San Francisco Union Square', -1, 4, 5, '333 O Farrell St', 'San Francisco', 'California', '94102','reservations@hiltonsanfrancisco.com' ),
                    ('HILN', 1002, 'Waldorf Astoria San Francisco', -1,5, 5, '9850 Wilshire Blvd',  'San Francisco', 'California', '90210', 'info@waldorfastoriabeverlyhills.com'),
                    ('HILN', 1003, 'Hilton Chicago Magnificent Mile', -1, 4, 5, '198 E Delaware Pl', 'Chicago', 'Illinois', '60611', 'info@hiltonhhicagomm.com'),
                    ('HILN', 1004,	'Conrad New York Downtown', -1, 4, 5, '102 North End Ave', 'New York', 'NY', '10282', 'info@conradnewyorkdowntown.com'),
                    ('HILN', 1005, 'Hilton New Orleans Riverside',-1, 4,5, '2 Poydras St.', 'New Orleans', 'Louisiana', '70130', 'info@hiltonneworleansriverside.com'),
                    ('HILN', 1006, 'Hilton Orlando Bonnet Creek', -1, 4, 5, '14100 Bonnet Creek Resort Ln', 'Orlando', 'FL', '32821','info@hiltonbonnetcreek.com'),
                    ('HILN',1007, 'Hilton Hawaiian Village Waikiki Beach Resort', -1, 4, 5, '2005 Kalia Rd', 'Honolulu', 'Hawaii', '96815', 'info@hiltonhawaiianvillage.com'),
                    ('HILN',1008, 'Hilton Los Cabos Beach & Golf Resort', -1, 4, 5, 'Carretera Transpeninsular Km 19.5', 'Los Cabos', 'California', '23447', 'info@hiltonloscabos.com');
                    
insert into employee values
			(1000, 'John', 'Smith', 123456789, '123 Main St.', 'San Francisco', 'California', '94102', 'john.smith@email.com','HILN',  1001, '1234'),
            (1001,'Samuel', 'Curtis', 145236852, '3883 Natoque Rd.', 'Beverly Hills', 'California', '90210','cras.dolor.dolor@hotmail.ca','HILN',  1002, '1234'),
			(1002,'Aileen', 'Fisher',120254863,'9020 Eros Av.','Chicago', 'Illinois', '60611','integer.vitae@google.edu','HILN', 1003, '1234'),
			(1003,'Armando', 'Macdonald',254875410,'7876 Cras Av.' ,'New York', 'NY', '10282','proin.non.massa@outlook.net','HILN', 1004, '1234'),
			(1004,'Kelsie', 'Henderson',745120369,'355-1941 Primis Av.','New Orleans', 'Louisiana', '70130', 'morbi@yahoo.com','HILN', 1005, '1234'),
			(1005,'Wallace', 'White',424158632,'426 Ullamcorper St.','Orlando', 'FL', '32821','lorem.vehicula@icloud.couk','HILN', 1006, '1234'),
			(1006,'Dorian', 'Hoover',854120365,'5042 Luctus Road', 'Honolulu', 'Hawaii', '96815','tempus.non@yahoo.net','HILN',1007, '1234'),
			(1007,'Orli', 'Ortiz',632104852,'9419 Venenatis St.','Los Cabos', 'California', '23447','dignissim@yahoo.couk','HILN',1008, '1234');

update hotel set manager_ID = 1000 where hotel_code = 1001;
update hotel set manager_ID = 1001 where hotel_code = 1002;
update hotel set manager_ID = 1002 where hotel_code = 1003;
update hotel set manager_ID = 1003 where hotel_code = 1004;
update hotel set manager_ID = 1004 where hotel_code = 1005;
update hotel set manager_ID = 1005 where hotel_code = 1006;
update hotel set manager_ID = 1006 where hotel_code = 1007;
update hotel set manager_ID = 1007 where hotel_code = 1008;

-- hotel 1001
INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (1,'HILN', 1001, 101, 1, 100, 'Mountain', 'No', 'Cozy room with mountain view', 'Available'),
(2,'HILN', 1001, 102, 2, 120, 'Sea', 'No', 'Bright room with sea view', 'Available'),
(3,'HILN', 1001, 201, 3, 180, 'Mountain', 'Yes', 'Spacious room with mountain view', 'Available'),
(4,'HILN', 1001, 301, 4, 250, 'Sea', 'No', 'Luxurious room with sea view', 'Available'),
(5,'HILN', 1001, 401, 5, 350, 'Mountain', 'Yes', 'Grand room with mountain view', 'Available');

INSERT INTO Room(hotel_chain_code, hotel_code, room_no, room_info_no)
VALUES ('HILN', 1001, 101, 1),
('HILN', 1001, 102, 2),
('HILN', 1001, 201, 3),
('HILN', 1001, 301, 4),
('HILN', 1001, 401, 5);


-- hotel 1002
INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (6,'HILN', 1002, 101, 1, 200, 'Mountain', 'Yes', 'Cozy room with mountain view', 'Available'),
(7,'HILN', 1002, 102, 2, 220, 'Sea', 'No', 'Bright room with sea view', 'Available'),
(8,'HILN', 1002, 201, 3, 280, 'Mountain', 'Yes', 'Spacious room with mountain view', 'Available'),
(9,'HILN', 1002, 301, 4, 400, 'Sea', 'No', 'Luxurious room with sea view', 'Available'),
(10,'HILN', 1002, 401, 5, 550, 'Mountain', 'Yes', 'Grand room with mountain view', 'Available');

INSERT INTO Room(hotel_chain_code, hotel_code, room_no, room_info_no)
VALUES ('HILN', 1002, 101, 6),
('HILN', 1002, 102, 7),
('HILN', 1002, 201, 8),
('HILN', 1002, 301, 9),
('HILN', 1002, 401, 10);

-- hotel 1003

INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (11,'HILN', 1003, 101, 1, 180, 'Mountain', 'Yes', 'Cozy room with mountain view', 'Available'),
(12,'HILN', 1003, 102, 2, 200, 'Sea', 'No', 'Bright room with sea view', 'Available'),
(13,'HILN', 1003, 201, 3, 260, 'Mountain', 'Yes', 'Spacious room with mountain view', 'Available'),
(14,'HILN', 1003, 301, 4, 360, 'Sea', 'No', 'Luxurious room with sea view', 'Available'),
(15,'HILN', 1003, 401, 5, 500, 'Mountain', 'Yes', 'Grand room with mountain view', 'Available');

INSERT INTO Room(hotel_chain_code, hotel_code, room_no, room_info_no)
VALUES ('HILN', 1003, 101, 11),
('HILN', 1003, 102, 12),
('HILN', 1003, 201, 13),
('HILN', 1003, 301, 14),
('HILN', 1003, 401, 15);

-- hotel 1004
INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (16,'HILN', 1004, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(17,'HILN', 1004, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(18,'HILN', 1004, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(19,'HILN', 1004, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(20,'HILN', 1004, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');

INSERT INTO Room(hotel_chain_code, hotel_code, room_no, room_info_no)
VALUES ('HILN', 1004, 101, 16),
('HILN', 1004, 102, 17),
('HILN', 1004, 201, 18),
('HILN', 1004, 301, 19),
('HILN', 1004, 401, 20);


-- hotel 1005
INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (21,'HILN', 1005, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(22,'HILN', 1005, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(23,'HILN', 1005, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(24,'HILN', 1005, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(25,'HILN', 1005, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');

INSERT INTO Room(hotel_chain_code, hotel_code, room_no, room_info_no)
VALUES ('HILN', 1005, 101, 21),
('HILN', 1005, 102, 22),
('HILN', 1005, 201, 23),
('HILN', 1005, 301, 24),
('HILN', 1005, 401, 25);


-- hotel 1006
INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (26,'HILN', 1006, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
 (27,'HILN', 1006, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
 (28,'HILN', 1006, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
 (29,'HILN', 1006, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
 (30,'HILN', 1006, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');
 
 INSERT INTO Room(hotel_chain_code, hotel_code, room_no, room_info_no)
VALUES ('HILN', 1006, 101, 26),
('HILN', 1006, 102, 27),
('HILN', 1006, 201, 28),
('HILN', 1006, 301, 29),
('HILN', 1006, 401, 30);

-- hotel 1007
INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (31,'HILN', 1007, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(32,'HILN', 1007, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(33,'HILN', 1007, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(34,'HILN', 1007, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(35,'HILN', 1007, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');

INSERT INTO Room(hotel_chain_code, hotel_code, room_no, room_info_no)
VALUES ('HILN', 1007, 101, 31),
('HILN', 1007, 102, 32),
('HILN', 1007, 201, 33),
('HILN', 1007, 301, 34),
('HILN', 1007, 401, 35);

-- hotel 1008
INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (36,'HILN', 1008, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(37,'HILN', 1008, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(38,'HILN', 1008, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(39,'HILN', 1008, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(40,'HILN', 1008, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');

INSERT INTO Room(hotel_chain_code, hotel_code, room_no, room_info_no)
VALUES ('HILN', 1008, 101, 36),
('HILN', 1008, 102, 37),
('HILN', 1008, 201, 38),
('HILN', 1008, 301, 39),
('HILN', 1008, 401, 40);


-- Hotel 2

-- Insert data for MARR hotel chain
-- Here, the hotels with codes 2005 and 2006 are both in New Orleans, Louisiana, under the 'MARR' hotel chain.
INSERT INTO Hotel (hotel_chain_code, hotel_code, name, manager_ID, rating, num_of_rooms, number_street, city, state_prov, zip, email)
VALUES
('MARR', 2001, 'Marriott Marquis San Diego Marina', -1, 4, 1360, '333 W Harbor Dr', 'San Diego', 'California', '92101', 'info@marriottmarquissandiegomarina.com'),
('MARR', 2002, 'Marriott Marquis Houston', -1, 4, 1000, '1777 Walker St', 'Houston', 'Texas', '77010', 'info@marriottmarquishouston.com'),
('MARR', 2003, 'JW Marriott Austin', -1, 4, 1012, '110 E 2nd St', 'Austin', 'Texas', '78701', 'info@jwmarriottaustin.com'),
('MARR', 2004, 'Ritz-Carlton New Orleans', -1, 4, 527, '921 Canal St', 'New Orleans', 'Louisiana', '70112', 'info@ritzcarltonneworleans.com'),
('MARR', 2005, 'Courtyard New Orleans Downtown', -1, 3, 140, '124 Saint Charles Ave', 'New Orleans', 'Louisiana', '70130', 'info@courtyardneworleansdowntown.com'),
('MARR', 2006, 'Marriott New Orleans', -1, 4, 1327, '555 Canal St', 'New Orleans', 'Louisiana', '70130', 'info@marriottneworleans.com'),
('MARR', 2007, 'The Westin New Orleans Canal Place', -1, 4, 437, '100 Rue Iberville', 'New Orleans', 'Louisiana', '70130', 'info@westinneworleanscanalplace.com'),
('MARR', 2008, 'Sheraton New Orleans Hotel', -1, 4, 1110, '500 Canal St', 'New Orleans', 'Louisiana', '70130', 'info@sheratonneworleanshotel.com');


-- Employee for MARR hotel
INSERT INTO Employee
VALUES (2001, 'John', 'Doe', 123456780, '123 Main St', 'Chicago', 'Illinois', '60611', 'johndoe@marr.com', 'MARR', 2001, '1234'),
(2002, 'Jane', 'Doe', 987654321, '456 Oak St', 'Chicago', 'Illinois', '60611', 'janedoe@marr.com', 'MARR', 2002, '1234'),
(2003, 'Bob', 'Smith', 555555555, '789 Elm St', 'New York', 'NY', '10005', 'bobsmith@marr.com', 'MARR', 2003, '1234'),
(2004, 'Alice', 'Johnson', 111111111, '101 Broadway', 'New York', 'NY', '10007', 'alicejohnson@marr.com', 'MARR', 2004, '1234'),
(2005, 'Sam', 'Lee', 222222222, '200 Canal St', 'New Orleans', 'Louisiana', '70130', 'samlee@marr.com', 'MARR', 2005, '1234'),
(2006, 'Karen', 'Nguyen', 333333333, '300 Bourbon St', 'New Orleans', 'Louisiana', '70130', 'karennguyen@marr.com', 'MARR', 2006, '1234'),
(2007, 'Tom', 'Wilson', 444444444, '400 Chartres St', 'New Orleans', 'Louisiana', '70130', 'tomwilson@marr.com', 'MARR', 2007, '1234'),
(2008, 'Sara', 'Brown', 666666666, '500 Decatur St', 'New Orleans', 'Louisiana', '70130', 'sarabrown@marr.com', 'MARR', 2008, '1234');


-- Set John Doe as the manager of hotel 1001
UPDATE Hotel
SET manager_id = 2001
WHERE hotel_chain_code = 'MARR' AND hotel_code = 2001;

-- Set Jane Doe as the manager of hotel 1002
UPDATE Hotel
SET manager_id = 2002
WHERE hotel_chain_code = 'MARR' AND hotel_code = 2002;

-- Set Bob Smith as the manager of hotel 1003
UPDATE Hotel
SET manager_id = 2003
WHERE hotel_chain_code = 'MARR' AND hotel_code = 2003;

-- Set Alice Johnson as the manager of hotel 1004
UPDATE Hotel
SET manager_id = 2004
WHERE hotel_chain_code = 'MARR' AND hotel_code = 2004;

-- Set Sam Lee as the manager of hotel 1005
UPDATE Hotel
SET manager_id = 2005
WHERE hotel_chain_code = 'MARR' AND hotel_code = 2005;

-- Set Karen Nguyen as the manager of hotel 1006
UPDATE Hotel
SET manager_id = 2006
WHERE hotel_chain_code = 'MARR' AND hotel_code = 2006;

-- Set Tom Wilson as the manager of hotel 1007
UPDATE Hotel
SET manager_id = 2007
WHERE hotel_chain_code = 'MARR' AND hotel_code = 2007;

-- Set Sara Brown as the manager of hotel 1008
UPDATE Hotel
SET manager_id = 2008
WHERE hotel_chain_code = 'MARR' AND hotel_code = 2008;


-- hotel 2001
INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (41,'MARR', 2001, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(42,'MARR', 2001, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(43,'MARR', 2001, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(44,'MARR', 2001, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(45,'MARR', 2001, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');

INSERT INTO Room(hotel_chain_code, hotel_code, room_no, room_info_no)
VALUES ('MARR', 2001, 101, 41),
('MARR', 2001, 102, 42),
('MARR',2001, 201, 43),
('MARR', 2001, 301, 44),
('MARR', 2001, 401, 45);


-- hotel 2002
INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (46,'MARR', 2002, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(47,'MARR', 2002, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(48,'MARR', 2002, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(49,'MARR', 2002, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(50,'MARR', 2002, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');

INSERT INTO Room(hotel_chain_code, hotel_code, room_no, room_info_no)
VALUES ('MARR', 2002, 101, 46),
('MARR', 2002, 102, 47),
('MARR',2002, 201, 48),
('MARR', 2002, 301, 49),
('MARR', 2002, 401, 50);

-- hotel 2003
INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (51,'MARR', 2003, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(52,'MARR', 2003, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(53,'MARR', 2003, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(54,'MARR', 2003, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(55,'MARR', 2003, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');

INSERT INTO Room(hotel_chain_code, hotel_code, room_no, room_info_no)
VALUES ('MARR', 2003, 101, 51),
('MARR', 2003, 102, 52),
('MARR',2003, 201, 53),
('MARR', 2003, 301, 54),
('MARR', 2003, 401, 55);

-- hotel 2004
INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (56,'MARR', 2004, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(57,'MARR', 2004, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(58,'MARR', 2004, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(59,'MARR', 2004, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
 (60,'MARR', 2004, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');
 
INSERT INTO Room(hotel_chain_code, hotel_code, room_no, room_info_no)
VALUES ('MARR', 2004, 101, 56),
('MARR', 2004, 102, 57),
('MARR',2004, 201, 58),
('MARR', 2004, 301, 59),
('MARR', 2004, 401, 60);


-- hotel 2005
INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (61,'MARR', 2005, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(62,'MARR', 2005, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(63,'MARR', 2005, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(64,'MARR', 2005, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(65,'MARR', 2005, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');

INSERT INTO Room(hotel_chain_code, hotel_code, room_no, room_info_no)
VALUES ('MARR', 2005, 101, 61),
('MARR', 2005, 102, 62),
('MARR',2005, 201, 63),
('MARR', 2005, 301, 64),
('MARR', 2005, 401, 65);

-- hotel 2006
INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (66,'MARR', 2006, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(67,'MARR', 2006, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(68,'MARR', 2006, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(69,'MARR', 2006, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(70,'MARR', 2006, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');

INSERT INTO Room (hotel_chain_code, hotel_code, room_no, room_info_no)
VALUES ('MARR', 2006, 101, 66),
       ('MARR', 2006, 102, 67),
       ('MARR', 2006, 201, 68),
       ('MARR', 2006, 301, 69),
       ('MARR', 2006, 401, 70);


-- hotel 2007
INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (71,'MARR', 2007, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(72,'MARR', 2007, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(73,'MARR', 2007, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(74,'MARR', 2007, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(75,'MARR', 2007, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');

INSERT INTO Room (hotel_chain_code, hotel_code, room_no, room_info_no)
VALUES 
('MARR', 2007, 101, 71),
('MARR', 2007, 102, 72),
('MARR', 2007, 201, 73),
('MARR', 2007, 301, 74),
('MARR', 2007, 401, 75);


-- hotel 2008
INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (76,'MARR', 2008, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(77,'MARR', 2008, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(78,'MARR', 2008, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(79,'MARR', 2008, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(80,'MARR', 2008, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');
INSERT INTO Room (hotel_chain_code, hotel_code, room_no, room_info_no)
VALUES ('MARR', 2008, 101, 76),
('MARR', 2008, 102, 77),
('MARR', 2008, 201, 78),
('MARR', 2008, 301, 79),
('MARR', 2008, 401, 80);

-- Hotel 3
INSERT INTO Hotel(hotel_chain_code, hotel_code, name, manager_ID, rating, num_of_rooms, number_street, city, state_prov, zip, email)
VALUES
('CHOI', 3001, 'CHOI Hotel Downtown', -1, 4, 5, '123 Main St', 'New York', 'NY', '10001', 'choi_downtown@choi.com'),
('CHOI', 3002, 'CHOI Hotel Midtown', -1, 3, 5, '456 Fifth Ave', 'New York', 'NY', '10016', 'choi_midtown@choi.com'),
('CHOI', 3003, 'CHOI Hotel Uptown', -1, 4, 5, '789 Sixth Ave', 'New York', 'NY', '10022', 'choi_uptown@choi.com'),
('CHOI', 3004, 'CHOI Hotel Brooklyn', -1, 3, 5, '456 Seventh St', 'Brooklyn', 'NY', '11215', 'choi_brooklyn@choi.com'),
('CHOI', 3005, 'CHOI Hotel Queens', -1, 3, 5, '123 Eighth St', 'Queens', 'NY', '11355', 'choi_queens@choi.com'),
('CHOI', 3006, 'CHOI Hotel JFK', -1, 3, 5, '101 JFK Blvd', 'Jamaica', 'NY', '11430', 'choi_jfk@choi.com'),
('CHOI', 3007, 'CHOI Hotel LaGuardia', -1, 3, 5, '202 LaGuardia Rd', 'East Elmhurst', 'NY', '11369', 'choi_lga@choi.com'),
('CHOI', 3008, 'CHOI Hotel LaGuardia 2', -1, 3, 5, '404 LaGuardia Rd', 'East Elmhurst', 'NY', '11370', 'choi_lga2@choi.com');

INSERT INTO Employee
VALUES
(3001, 'John', 'Doe', 452103520, '123 Main St', 'New York', 'NY', '10001', 'john@choi.com', 'CHOI', 3001, '1234'),
(3002, 'Jane', 'Smith', 741520321, '456 Fifth Ave', 'New York', 'NY', '10016', 'jane@choi.com', 'CHOI', 3002, '1234'),
(3003, 'David', 'Lee', 111222333, '789 Sixth Ave', 'New York', 'NY', '10022', 'david@choi.com', 'CHOI', 3003, '1234'),
(3004, 'Emily', 'Chen', 444555666, '456 Seventh St', 'Brooklyn', 'NY', '11215', 'emily@choi.com', 'CHOI', 3004, '1234'),
(3005, 'Michael', 'Nguyen', 777888999, '123 Eighth St', 'Queens', 'NY', '11355', 'michael@choi.com', 'CHOI', 3005, '1234'),
(3006, 'Jennifer', 'Kim', 121212121, '101 JFK Blvd', 'Jamaica', 'NY', '11430', 'jennifer@choi.com', 'CHOI', 3006, '1234'),
(3007, 'Eric', 'Wong', 989898989, '202 LaGuardia Rd', 'East Elmhurst', 'NY', '11369', 'eric@choi.com', 'CHOI', 3007, '1234'),
(3008, 'Jessica', 'Chang', 121212123, '404 LaGuardia Rd', 'East Elmhurst', 'NY', '11370', 'jessica@choi.com', 'CHOI', 3008, '1234');

UPDATE Hotel SET manager_ID = 3001 WHERE hotel_code = 3001;
UPDATE Hotel SET manager_ID = 3002 WHERE hotel_code = 3002;
UPDATE Hotel SET manager_ID = 3003 WHERE hotel_code = 3003;
UPDATE Hotel SET manager_ID = 3004 WHERE hotel_code = 3004;
UPDATE Hotel SET manager_ID = 3005 WHERE hotel_code = 3005;
UPDATE Hotel SET manager_ID = 3006 WHERE hotel_code = 3006;
UPDATE Hotel SET manager_ID = 3007 WHERE hotel_code = 3007;
UPDATE Hotel SET manager_ID = 3008 WHERE hotel_code = 3008;


INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (81,'CHOI', 3001, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(82,'CHOI', 3001, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(83,'CHOI', 3001, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(84,'CHOI', 3001, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(85,'CHOI', 3001, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');

INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (86,'CHOI', 3002, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(87,'CHOI', 3002, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(88,'CHOI', 3002, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(89,'CHOI', 3002, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(90,'CHOI', 3002, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');

INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (91,'CHOI', 3003, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(92,'CHOI', 3003, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(93,'CHOI', 3003, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(94,'CHOI', 3003, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(95,'CHOI', 3003, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');

INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (96,'CHOI', 3004, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(97,'CHOI', 3004, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(98,'CHOI', 3004, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(99,'CHOI', 3004, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(100,'CHOI', 3004, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');

INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (101,'CHOI', 3005, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(102,'CHOI', 3005, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(103,'CHOI', 3005, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(104,'CHOI', 3005, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(105,'CHOI', 3005, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');


INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (106,'CHOI', 3006, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(107,'CHOI', 3006, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(108,'CHOI', 3006, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(109,'CHOI', 3006, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(110,'CHOI', 3006, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');


INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (111,'CHOI', 3007, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(112,'CHOI', 3007, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(113,'CHOI', 3007, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(114,'CHOI', 3007, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(115,'CHOI', 3007, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');


INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (116,'CHOI', 3008, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(117,'CHOI', 3008, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(118,'CHOI', 3008, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(119,'CHOI', 3008, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(120,'CHOI', 3008, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');


INSERT INTO Room(hotel_chain_code, hotel_code, room_no, room_info_no)
SELECT hotel_chain_code, hotel_code, room_no, room_info_no
FROM RoomInfo
WHERE hotel_chain_code = 'CHOI';




-- Hotel 4

INSERT INTO Hotel(hotel_chain_code, hotel_code, name, manager_ID, rating, num_of_rooms, number_street, city, state_prov, zip, email)
VALUES
  ('IHGN', 4001, 'InterContinental New York Times Square', -1, 4, 5, '300 W 44th St', 'New York', 'NY', '10036', 'reservations@icnyts.com'),
  ('IHGN', 4002, 'InterContinental The Barclay New York', -1, 4, 5, '111 E 48th St', 'New York', 'NY', '10017', 'reservations@intercontinentalnybarclay.com'),
  ('IHGN', 4003, 'Holiday Inn New York City - Times Square', -1, 3, 5, '585 8th Ave', 'New York', 'NY', '10018', 'reservations@holidayinntimessquare.com'),
  ('IHGN', 4004, 'Holiday Inn Express New York City - Herald Square', -1, 3, 5, '60 W 36th St', 'New York', 'NY', '10018', 'reservations@hiexheraldsquare.com'),
  ('IHGN', 4005, 'Crowne Plaza Times Square Manhattan', -1, 4, 5, '1605 Broadway', 'New York', 'NY', '10019', 'reservations@cpmanhattantimessquare.com'),
  ('IHGN', 4006, 'Even Hotel New York - Times Square South', -1, 4, 5, '321 W 35th St', 'New York', 'NY', '10001', 'reservations@evenhoteltimessquaresouth.com'),
  ('IHGN', 4007, 'Hotel Indigo Lower East Side New York', -1, 4, 5, '171 Ludlow St', 'New York', 'NY', '10002', 'reservations@hotelindigoles.com'),
  ('IHGN', 4008, 'Staybridge Suites Times Square - New York City', -1, 4, 5, '340 W 40th St', 'New York', 'NY', '10018', 'reservations@staybridgetimessquare.com');

INSERT INTO Employee
VALUES
(4001, 'Eleanor', 'Rodriguez', 437829615, '123 Madison St', 'New York', 'NY', '10001', 'johndoe@ihgn.com', 'IHGN', 4001, '1234'),
(4002, 'Jane', 'Smith', 879430025, '456 Elm St', 'New York', 'NY', '10002', 'janesmith@ihgn.com', 'IHGN', 4002, '1234'),
(4003, 'Bob', 'Johnson', 187503926, '789 Oak St', 'New York', 'NY', '10003', 'bobjohnson@ihgn.com', 'IHGN', 4003, '1234'),
(4004, 'Sara', 'Lee', 651042398, '246 5th Ave', 'New York', 'NY', '10004', 'saralee@ihgn.com', 'IHGN', 4004, '1234'),
(4005, 'Mike', 'Brown', 940837261, '135 6th Ave', 'New York', 'NY', '10005', 'mikebrown@ihgn.com', 'IHGN', 4005, '1234'),
(4006, 'Karen', 'Jones', 502348197, '789 Broadway', 'New York', 'NY', '10006', 'karenjones@ihgn.com', 'IHGN', 4006, '1234'),
(4007, 'Tom', 'Williams', 319687502, '246 Park Ave', 'New York', 'NY', '10007', 'tomwilliams@ihgn.com', 'IHGN', 4007, '1234'),
(4008, 'Linda', 'Davis', 726194038, '135 Madison Ave', 'New York', 'NY', '10008', 'lindadavis@ihgn.com', 'IHGN', 4008, '1234');

UPDATE Hotel SET manager_ID = 4001 WHERE hotel_code = 4001;
UPDATE Hotel SET manager_ID = 4002 WHERE hotel_code = 4002;
UPDATE Hotel SET manager_ID = 4003 WHERE hotel_code = 4003;
UPDATE Hotel SET manager_ID = 4004 WHERE hotel_code = 4004;
UPDATE Hotel SET manager_ID = 4005 WHERE hotel_code = 4005;
UPDATE Hotel SET manager_ID = 4006 WHERE hotel_code = 4006;
UPDATE Hotel SET manager_ID = 4007 WHERE hotel_code = 4007;
UPDATE Hotel SET manager_ID = 4008 WHERE hotel_code = 4008;


INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (121,'IHGN', 4001, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(122,'IHGN', 4001, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(123,'IHGN', 4001, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(124,'IHGN', 4001, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(125,'IHGN', 4001, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');

INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (126,'IHGN', 4002, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(127,'IHGN', 4002, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(128,'IHGN', 4002, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(129,'IHGN', 4002, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(130,'IHGN', 4002, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');

INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (131,'IHGN', 4003, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(132,'IHGN', 4003, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(133,'IHGN', 4003, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(134,'IHGN', 4003, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(135,'IHGN', 4003, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');

INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (136,'IHGN', 4004, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(137,'IHGN', 4004, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(138,'IHGN', 4004, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(139,'IHGN', 4004, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(140,'IHGN', 4004, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');

INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (141,'IHGN', 4005, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(142,'IHGN', 4005, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(143,'IHGN', 4005, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(144,'IHGN', 4005, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(145,'IHGN', 4005, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');
INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (146,'IHGN', 4006, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(147,'IHGN', 4006, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(148,'IHGN', 4006, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(149,'IHGN', 4006, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(150,'IHGN', 4006, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');
INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (151,'IHGN', 4007, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(152,'IHGN', 4007, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(153,'IHGN', 4007, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(154,'IHGN', 4007, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(155,'IHGN', 4007, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');
INSERT INTO RoomInfo(room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (156,'IHGN', 4008, 101, 1, 220, 'Sea', 'No', 'Cozy room with sea view', 'Available'),
(157,'IHGN', 4008, 102, 2, 240, 'Mountain', 'Yes', 'Bright room with mountain view', 'Available'),
(158,'IHGN', 4008, 201, 3, 310, 'Sea', 'No', 'Spacious room with sea view', 'Available'),
(159,'IHGN', 4008, 301, 4, 420, 'Mountain', 'Yes', 'Luxurious room with mountain view', 'Available'),
(160,'IHGN', 4008, 401, 5, 550, 'Sea', 'No', 'Grand room with sea view', 'Available');


INSERT INTO Room(hotel_chain_code, hotel_code, room_no, room_info_no)
SELECT hotel_chain_code, hotel_code, room_no, room_info_no
FROM RoomInfo
WHERE hotel_chain_code = 'IHGN';

-- Hotel 5
-- 2 of the hotels are located in the same city ('New York')
INSERT INTO Hotel (hotel_chain_code, hotel_code, name, manager_ID, rating, num_of_rooms, number_street, city, state_prov, zip, email)
VALUES
('HYAT', 5001, 'HYAT Regency', -1, 4, 5, '123 Main St', 'New York', 'NY', '10001', 'hyatregencyny@hyat.com'),
('HYAT', 5002, 'HYAT Place', -1, 3, 5, '456 Elm St', 'New York', 'NY', '10001', 'hyatplaceny@hyat.com'),
('HYAT', 5003, 'HYAT Grand', -1, 5, 5, '789 Maple St', 'Chicago', 'IL', '60601', 'hyatgrandchi@hyat.com'),
('HYAT', 5004, 'HYAT Resort', -1, 4, 5, '321 Oak St', 'Los Angeles', 'CA', '90001', 'hyatresortla@hyat.com'),
('HYAT', 5005, 'HYAT House', -1, 3, 5, '654 Pine St', 'Houston', 'TX', '77001', 'hyathousehou@hyat.com'),
('HYAT', 5006, 'HYAT Centric', -1, 4, 5, '987 Cedar St', 'San Francisco', 'CA', '94101', 'hyatcentricsf@hyat.com'),
('HYAT', 5007, 'HYAT Garden', -1, 3, 5, '246 Birch St', 'Atlanta', 'GA', '30301', 'hyatgardenatl@hyat.com'),
('HYAT', 5008, 'HYAT Place, Dallas', -1, 4, 5, '135 Walnut St', 'Dallas', 'TX', '75201', 'hyatplacedal@hyat.com');

-- update hotel set name = 'HYAT Place, Dallas' where hotel_code = 5008

INSERT INTO Employee
VALUES
(5001, 'Sophia' ,'Johnson', 319856274, '321 Oak St', 'New York', 'NY', '10001', 'sophiajohnson@hyat.com', 'HYAT', 5001, '1234'),
(5002, 'Isabella' ,'Garcia', 624892701, '753 Cedar St', 'New York', 'NY', '10001', 'isabellagarcia@hyat.com', 'HYAT', 5002, '1234'),
(5003, 'Jim', 'Smith', 345678901, '246 Birch St', 'Chicago', 'IL', '60601', 'jimsmith@hyat.com', 'HYAT', 5003, '1234'),
(5004, 'Janet', 'Lee', 456789012, '246 Walnut St', 'Los Angeles', 'CA', '90001', 'janetlee@hyat.com', 'HYAT', 5004, '1234'),
(5005, 'Jason', 'Chen', 567890123, '410 Redwood Way', 'Houston', 'TX', '77001', 'jasonchen@hyat.com', 'HYAT', 5005, '1234'),
(5006, 'Jessica', 'Wu', 678901234, '4562 Cypress Road', 'San Francisco', 'CA', '94101', 'jessicawu@hyat.com', 'HYAT', 5006, '1234'),
(5007, 'Jack', 'Brown', 789012345, '996 Willow Circle', 'Atlanta', 'GA', '30301', 'jackbrown@hyat.com', 'HYAT', 5007, '1234'),
(5008, 'Jenny', 'Wang', 890123456, '8 Acacia Court', 'Dallas', 'TX', '75201', 'jennywang@hyat.com', 'HYAT', 5008, '1234');


UPDATE Hotel SET manager_ID = 5001 WHERE hotel_code = 5001;
UPDATE Hotel SET manager_ID = 5002 WHERE hotel_code = 5002;
UPDATE Hotel SET manager_ID = 5003 WHERE hotel_code = 5003;
UPDATE Hotel SET manager_ID = 5004 WHERE hotel_code = 5004;
UPDATE Hotel SET manager_ID = 5005 WHERE hotel_code = 5005;
UPDATE Hotel SET manager_ID = 5006 WHERE hotel_code = 5006;
UPDATE Hotel SET manager_ID = 5007 WHERE hotel_code = 5007;
UPDATE Hotel SET manager_ID = 5008 WHERE hotel_code = 5008;





INSERT INTO RoomInfo (room_info_no, hotel_chain_code, hotel_code, room_no, capacity, price, view, possible_extension, description, status)
VALUES (161, 'HYAT', 5001, 101, 1, 200, 'Mountain', 'Yes', 'Standard Room', 'Available'),
       (162, 'HYAT', 5001, 102, 2, 200, 'Mountain', 'Yes', 'Standard Room', 'Available'),
       (163, 'HYAT', 5001, 103, 3, 300, 'Mountain', 'Yes', 'Deluxe Room', 'Available'),
       (164, 'HYAT', 5001, 104, 4, 400, 'Sea', 'No', 'Family Suite', 'Available'),
       (165, 'HYAT', 5001, 105, 5, 550, 'Mountain', 'No', 'Family Suite', 'Available'),
       
       (166, 'HYAT', 5002, 101, 1, 200, 'Mountain', 'Yes', 'Standard Room', 'Available'),
       (167, 'HYAT', 5002, 102, 2, 200, 'Mountain', 'Yes', 'Standard Room', 'Available'),
       (168, 'HYAT', 5002, 103, 3, 300, 'Mountain', 'Yes', 'Deluxe Room', 'Available'),
       (169, 'HYAT', 5002, 104, 4, 400, 'Sea', 'No', 'Family Suite', 'Available'),
       (170, 'HYAT', 5002, 105, 5, 550, 'Mountain', 'No', 'Family Suite', 'Available'),
       
       (171, 'HYAT', 5003, 101, 1, 200, 'Mountain', 'Yes', 'Standard Room', 'Available'),
       (172, 'HYAT', 5003, 102, 2, 200, 'Mountain', 'Yes', 'Standard Room', 'Available'),
       (173, 'HYAT', 5003, 103, 3, 300, 'Mountain', 'Yes', 'Deluxe Room', 'Available'),
       (174, 'HYAT', 5003, 104, 4, 400, 'Sea', 'No', 'Family Suite', 'Available'),
       (175, 'HYAT', 5003, 105, 5, 550, 'Mountain', 'No', 'Family Suite', 'Available'),
       
       (176, 'HYAT', 5004, 101, 1, 200, 'Mountain', 'Yes', 'Standard Room', 'Available'),
       (177, 'HYAT', 5004, 102, 2, 200, 'Mountain', 'Yes', 'Standard Room', 'Available'),
       (178, 'HYAT', 5004, 103, 3, 300, 'Mountain', 'Yes', 'Deluxe Room', 'Available'),
       (179, 'HYAT', 5004, 104, 4, 400, 'Sea', 'No', 'Family Suite', 'Available'),
       (180, 'HYAT', 5004, 105, 5, 550, 'Mountain', 'No', 'Family Suite', 'Available'),
       
       
       (181, 'HYAT', 5005, 101, 1, 200, 'Mountain', 'Yes', 'Standard Room', 'Available'),
       (182, 'HYAT', 5005, 102, 2, 200, 'Mountain', 'Yes', 'Standard Room', 'Available'),
       (183, 'HYAT', 5005, 103, 3, 300, 'Mountain', 'Yes', 'Deluxe Room', 'Available'),
       (184, 'HYAT', 5005, 104, 4, 400, 'Sea', 'No', 'Family Suite', 'Available'),
       (185, 'HYAT', 5005, 105, 5, 550, 'Mountain', 'No', 'Family Suite', 'Available'),
       
       (186, 'HYAT', 5006, 101, 1, 200, 'Mountain', 'Yes', 'Standard Room', 'Available'),
       (187, 'HYAT', 5006, 102, 2, 200, 'Mountain', 'Yes', 'Standard Room', 'Available'),
       (188, 'HYAT', 5006, 103, 3, 300, 'Mountain', 'Yes', 'Deluxe Room', 'Available'),
       (189, 'HYAT', 5006, 104, 4, 400, 'Sea', 'No', 'Family Suite', 'Available'),
       (190, 'HYAT', 5006, 105, 5, 550, 'Mountain', 'No', 'Family Suite', 'Available'),
       
       (191, 'HYAT', 5007, 101, 1, 200, 'Mountain', 'Yes', 'Standard Room', 'Available'),
       (192, 'HYAT', 5007, 102, 2, 200, 'Mountain', 'Yes', 'Standard Room', 'Available'),
       (193, 'HYAT', 5007, 103, 3, 300, 'Mountain', 'Yes', 'Deluxe Room', 'Available'),
       (194, 'HYAT', 5007, 104, 4, 400, 'Sea', 'No', 'Family Suite', 'Available'),
       (195, 'HYAT', 5007, 105, 5, 550, 'Mountain', 'No', 'Family Suite', 'Available'),
       
       (196, 'HYAT', 5008, 101, 1, 200, 'Mountain', 'Yes', 'Standard Room', 'Available'),
       (197, 'HYAT', 5008, 102, 2, 200, 'Mountain', 'Yes', 'Standard Room', 'Available'),
       (198, 'HYAT', 5008, 103, 3, 300, 'Mountain', 'Yes', 'Deluxe Room', 'Available'),
       (199, 'HYAT', 5008, 104, 4, 400, 'Sea', 'No', 'Family Suite', 'Available'),
       (200, 'HYAT', 5008, 105, 5, 550, 'Mountain', 'No', 'Family Suite', 'Available');

INSERT INTO Room(hotel_chain_code, hotel_code, room_no, room_info_no)
SELECT hotel_chain_code, hotel_code, room_no, room_info_no
FROM RoomInfo
WHERE hotel_chain_code = 'HYAT';





INSERT INTO Customer (cust_ID, f_name, l_name, ssn, number_street, city, state_prov, email, registration_date, password) VALUES
(1000, 'Emma', 'Johnson', 567890123, '123 Main St', 'New York', 'NY', 'emma.johnson@gmail.com', '2022-02-12 08:30:00', '1234'),
(2000, 'Ethan', 'Williams', 987654321, '456 Elm St', 'New York', 'NY', 'ethan.williams@yahoo.com', '2022-03-01 14:15:00', '1234'),
(3000, 'Olivia', 'Brown', 123456789, '789 Maple St', 'Chicago', 'IL', 'olivia.brown@hotmail.com', '2022-01-25 10:45:00', '1234'),
(4000, 'Liam', 'Garcia', 345678901, '321 Oak St', 'Los Angeles', 'CA', 'liam.garcia@gmail.com', '2022-02-28 16:20:00', '1234'),
(5000, 'Ava', 'Miller', 234567890, '654 Pine St', 'Houston', 'TX', 'ava.miller@gmail.com', '2022-03-10 09:00:00', '1234'),
(6000, 'Noah', 'Davis', 789012345, '987 Cedar St', 'San Francisco', 'CA', 'noah.davis@yahoo.com', '2022-01-15 12:30:00', '1234'),
(7000, 'Sophia', 'Rodriguez', 456789012, '246 Birch St', 'Atlanta', 'GA', 'sophia.rodriguez@hotmail.com', '2022-03-20 18:45:00', '1234'),
(8000, 'Jackson', 'Martinez', 890123456, '135 Walnut St', 'Dallas', 'TX', 'jackson.martinez@gmail.com', '2022-02-01 11:00:00', '1234');

-- -------------------------------------------------------------------------------


INSERT INTO EmployeePosition(emp_ID, position)
SELECT emp_ID, 'manager' FROM Employee;




insert into hotelchainemail values
					  ('HILN', 'info@hiltonhotels.com'),
					  ('MARR', 'info@marriottinternational.com'),
                      ('CHOI', 'info@choicehotelsinternational.com'),
                      ('IHGN', 'info@intercontinentalhotelsgroup.com'),
                      ('HYAT', 'info@hyatthotelscorporation.com');


------------------------------------------------------------------

--- Bookings ---

-- Inserts a booking for Emma Johnson for a double room at the Hyat Place (HYAT) made on January 15th, 2023,
-- starting on June 1st, 2023 and ending on June 10th, 2023. The booking is not rented yet.
INSERT INTO Booking (booking_no, booking_date, start_date, end_date, no_of_persons, status, cust_ID, room_info_no) 
VALUES (2, '2023-01-15', '2023-06-01', '2023-06-10', 2, 'Not rented yet', 1000, 166);

-- Inserts a booking for Ethan Williams for a single room at the Holiday Inn New York City - Times Square (IHGN)
-- made on January 1st, 2023,
-- starting on June 15th, 2023 and ending on June 22nd, 2023. The booking is not rented yet.
INSERT INTO Booking (booking_no, booking_date, start_date, end_date, no_of_persons, status, cust_ID, room_info_no) 
VALUES (3, '2023-02-01', '2023-06-15', '2023-06-22', 1, 'Not rented yet', 2000, 132);

-- Inserts a booking for Olivia Brown for a double room at the CHOI LaGuardia (CHOI)
-- made on March 20th, 2023,
-- starting on June 5th, 2023 and ending on June 10th, 2023. The booking is cancelled.
INSERT INTO Booking (booking_no, booking_date, start_date, end_date, no_of_persons, status, cust_ID, room_info_no) 
VALUES (4, '2023-03-20', '2023-06-05', '2023-06-10', 2, 'Cancelled', 3000, 113);

-- Inserts a booking for Liam Garcia for a 3-person room at the CHOI Hotel Downtown (CHOI)
-- made on January 25th, 2023,
-- starting on July 5th, 2023 and ending on July 15th, 2023. The booking is not rented yet.
INSERT INTO Booking (booking_no, booking_date, start_date, end_date, no_of_persons, status, cust_ID, room_info_no) 
VALUES (5, '2023-01-25', '2023-07-05', '2023-07-15', 3, 'Not rented yet', 4000, 84);

-- Inserts a booking for Ava Miller for a double room at the Marriott New Orleans (MARR)
-- made on February 21st, 2023,
-- starting on May 15th, 2023 and ending on May 25th, 2023. The booking is archived.
INSERT INTO Booking (booking_no, booking_date, start_date, end_date, no_of_persons, status, cust_ID, room_info_no) 
VALUES (6, '2023-02-21', '2023-05-15', '2023-05-25', 2, 'Archived', 5000, 69);




