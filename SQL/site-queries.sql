-- Selects all bookings from Hilton Hotels (HILN)
select * from booking
where room_info_no in
(select room_info_no from room 
 where room.hotel_chain_code = 'HILN');