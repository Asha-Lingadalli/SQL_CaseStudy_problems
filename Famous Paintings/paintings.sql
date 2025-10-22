-- select * from artist
-- select * from canvas_size
-- select * from image_link
-- select * from museum_hours
-- select * from museum
-- select * from product_size
-- select * from subject
-- select * from work

--Queries--
--10) Identify the museums which are open on both Sunday and Monday. Display museum name, city.
select m.name as museum_name,m.city
from museum_hours mh1
join museum m on m.museum_id=mh1.museum_id
where day = 'Sunday' 
and exists (select 1 from museum_hours mh2
            where mh2.museum_id=mh1.museum_id
			and mh2.day = 'Monday')
			
--USing group by--
SELECT m.name , m.city
FROM museum m
JOIN museum_hours mh 
ON m.museum_id = mh.museum_id
WHERE mh.day IN ('Sunday', 'Monday')
GROUP BY m.museum_id, m.name, m.city
HAVING COUNT(DISTINCT mh.day) = 2;

--Self Join--
SELECT DISTINCT m.museum_name, m.city
FROM museum m
JOIN museum_hours mh1 ON m.museum_id = mh1.museum_id AND mh1.day = 'Sunday'
JOIN museum_hours mh2 ON m.museum_id = mh2.museum_id AND mh2.day = 'Monday';


--15) Which museum is open for the longest during a day. Dispay museum name, state and hours open and which day?
select * from (
select m.name as museum_name,m.state ,mh.day,
to_timestamp(open,'HH:MI AM') as open_time
,to_timestamp(close,'HH:MI PM') as close_time,
 to_timestamp(close,'HH:MI PM') - to_timestamp(open,'HH:MI AM')  as duration
 ,rank() over(order by (to_timestamp(close,'HH:MI PM') - to_timestamp(open,'HH:MI AM')) desc )
from museum_hours mh
join museum m
on m.museum_id = mh.museum_id) x
where x.rank = 1

--18) Display the country and the city with most no of museums.Output 2 seperate columns to mention the city and country. if there are multiple value, seperate them with comma.
with cte_country as(
select country,count(1),
rank() over(order by count(1) desc) as rnk
from museum
group by country
),
cte_city as(
select city,count(1),
rank() over(order by count(1) desc) as rnk
from museum
group by city
)
select string_agg(distinct country,' , ')as country,string_agg(city,' , ') as city
from cte_country
cross join cte_city
where cte_country.rnk=1
and cte_city.rnk=1















			