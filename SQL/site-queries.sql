-- Selects all bookings from Hilton Hotels (HILN)
select * from booking
where room_info_no in
(select room_info_no from room 
 where room.hotel_chain_code = 'HILN');

 -- Shows booking information for a customer (1000 in this case), with the name of the hotel in the same table
select
bookingList.booking_no, 
bookingList.booking_date,
bookingList.start_date,
bookingList.end_date,
bookingList.no_of_persons,
bookingList.status,
bookingList.room_info_no,
hotelNameAndRoom.name
from (select * from booking where cust_ID = '1000') as bookingList
left join
(select hotel.name, hotelCodeAndRoom.room_info_no
from hotel,
(select hotel_code, room_info_no from roominfo where roominfo.room_info_no in 
(select room_info_no from booking)) as hotelCodeAndRoom
where hotel.hotel_code=hotelCodeAndRoom.hotel_code) as hotelNameAndRoom
on bookingList.room_info_no=hotelNameAndRoom.room_info_no;