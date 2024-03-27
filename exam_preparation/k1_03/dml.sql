-- 01
select  
	s.*,
	c.name as custName, 
	a.name as artistName
from people as c
join services as s
	on s.customer_id = c.id
join people AS a
	on s.artist_id = a.id
where 
	s.type = 2 and 
    c.name = 'Ivan Ivanov' and 
    s.is_ready = 1 and 
    s.is_received = 1;

-- 02
select 
	c.name as CustomerName,
	SUM(s.final_price) as sumByCust
from people as c 
JOIN  services as s
	ON c.id = s.customer_id
where 
	s.is_ready = 1 and
    s.is_received = 1
group by s.customer_id
having 
	sumByCust > (select 
					avg(final_price)
				from 
					services)
order by 
	CustomerName
limit 6;