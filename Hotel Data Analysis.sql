/* what is count of different hotel types in database */


select hotel, count(*) as Hotel_count
from hotelds
group by hotel

select * from hotelds

/* what is the total count of bookings monthwise */


select arrival_date_month, count(*) as No_of_bookings
from hotelds
group by arrival_date_month

/* what is the total count of cancelled and not cancelled bokings */


select is_canceled, count(*) as Booking_cancelled
from hotelds
group by is_canceled

/* what is count of cancelled and not cancelled bookings monthwise */


select arrival_date_month,
		sum(case when is_canceled = 0 then 1 else 0 end ) as not_cancelled,
		sum(case when is_canceled = 1 then 1 else 0 end ) as cancelled
from hotelds
group by arrival_date_month


/* what is total count of cancelled and not cancelled bookings based on hotel type */

select hotel, is_canceled,
		count(*) as booking_count
from hotelds
group by hotel, is_canceled

select * from hotelds

/* what is the total count of canceled, Stayed and no show based on hotel type */


select hotel,
		sum(case when reservation_status = 'canceled' then 1 else 0 end ) as cancelled,
		sum(case when reservation_status = 'check-out' then 1 else 0 end ) as stayed,
		sum(case when reservation_status = 'No-show' then 1 else 0 end ) as didnt_show
from hotelds
group by hotel

/* Total bookings in city and resort hotel */


select hotel, count(*) as total_bookings from hotelds
group by hotel

/* What is the total count of bookings obtained from different countries */


select country, 
count(*) as total_bookings from hotelds
group by country
order by total_bookings desc

/* What is the total count of customers required parking space and not required parking space based on hotel type */

select hotel,
		sum(case when required_car_parking_spaces = 0 then 1 else 0 end ) as not_required,
		sum(case when required_car_parking_spaces = 1 then 1 else 0 end ) as requiredd
from hotelds
group by hotel