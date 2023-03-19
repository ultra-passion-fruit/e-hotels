

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
                    
