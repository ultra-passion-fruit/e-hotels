

insert into hotelchain values
					  ('HILN', 'Hilton Hotels', 8, '7930 Jones Branch Dr', 'McLean', 'Virginia', '22102'),
					  ("MARR", "Marriott International", 8,"10400 Fernwood Road", "Bethesda", "Maryland", "20817"),
                      ("CHOI", "Choice Hotels International", 8, "1 Choice Hotels Cir", "Rockville", "Maryland", "20850"),
                      ("IHGN", "InterContinental Hotels Group", 8, "3 Ravinia Drive", "Atlanta", "Georgia","30346"),
                      ("HYAT", "Hyatt Hotels Corporation", 8, "150 N Riverside Plaza", "Chicago", "Illinois", "60606");
 
-- manager_ID is set to -1, because there's no employee from now
insert into hotel values
					('HILN', 1001,	"Hilton San Francisco Union Square", -1, 4, 5, "333 O'Farrell St", "San Francisco", "California", "94102","reservations@hiltonsanfrancisco.com" ),
                    ('HILN', 1002, "Waldorf Astoria Beverly Hills", -1,5, 5, "9850 Wilshire Blvd",  "Beverly Hills", "California", "90210", "info@waldorfastoriabeverlyhills.com"),
                    ('HILN', 1003, "Hilton Chicago Magnificent Mile", -1, 4, 5, "198 E Delaware Pl", "Chicago", "Illinois", "60611", "info@hiltonhhicagomm.com"),
                    ('HILN', 1004,	"Conrad New York Downtown", -1, 4, 5, "102 North End Ave", "New York", "NY", "10282", "info@conradnewyorkdowntown.com"),
                    ('HILN', 1005, "Hilton New Orleans Riverside",-1, 4,5, "2 Poydras St.", "New Orleans", "Louisiana", "70130", "info@hiltonneworleansriverside.com"),
                    ('HILN', 1006, "Hilton Orlando Bonnet Creek", -1, 4, 5, "14100 Bonnet Creek Resort Ln", "Orlando", "FL", "32821","info@hiltonbonnetcreek.com"),
                    ('HILN',1007, "Hilton Hawaiian Village Waikiki Beach Resort", -1, 4, 5, "2005 Kalia Rd", "Honolulu", "Hawaii", "96815", "info@hiltonhawaiianvillage.com"),
                    ('HILN',1008, "Hilton Los Cabos Beach & Golf Resort", -1, 4, 5, "Carretera Transpeninsular Km 19.5", "Los Cabos", "California", "23447", "info@hiltonloscabos.com");
                    
insert into employee values
			(1000, "John", "Smith", 123456789, "123 Main St.", "San Francisco", "California", "94102", "john.smith@email.com",'HILN',  1001);
 insert into employee(f_name,l_name,ssn,number_street,city,state_prov,zip,email,hotel_chain_code,hotel_code) values           
            ("Samuel", "Curtis", 145236852, "3883 Natoque Rd.", "Beverly Hills", "California", "90210","cras.dolor.dolor@hotmail.ca",'HILN',  1002),
			  ("Aileen", "Fisher",120254863,"9020 Eros Av.","Chicago", "Illinois", "60611","integer.vitae@google.edu",'HILN', 1003),
			  ("Armando", "Macdonald",254875410,"7876 Cras Av." ,"New York", "NY", "10282","proin.non.massa@outlook.net",'HILN', 1004),
			  ("Kelsie", "Henderson",745120369,"355-1941 Primis Av.","New Orleans", "Louisiana", "70130", "morbi@yahoo.com",'HILN', 1005),
			  ("Wallace", "White",424158632,"426 Ullamcorper St.","Orlando", "FL", "32821","lorem.vehicula@icloud.couk",'HILN', 1006),
              ("Dorian", "Hoover",854120365,"5042 Luctus Road", "Honolulu", "Hawaii", "96815","tempus.non@yahoo.net",'HILN',1007),
				("Orli", "Ortiz",632104852,"9419 Venenatis St.","Los Cabos", "California", "23447","dignissim@yahoo.couk",'HILN',1008);

update hotel set manager_ID = 1000 where hotel_code = 1001;
update hotel set manager_ID = 1001 where hotel_code = 1002;
update hotel set manager_ID = 1002 where hotel_code = 1003;
update hotel set manager_ID = 1003 where hotel_code = 1004;
update hotel set manager_ID = 1004 where hotel_code = 1005;
update hotel set manager_ID = 1005 where hotel_code = 1006;
update hotel set manager_ID = 1006 where hotel_code = 1007;
update hotel set manager_ID = 1007 where hotel_code = 1008;






            