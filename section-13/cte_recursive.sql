-- memory table
WITH recursive countdown( val ) as (
--	initialization => first level or init values
--values(5)
select 5 as val
union
-- query recursive
select val - 1 from countdown where val > 1
)
-- select fields
select * from countdown;

with recursive counter ( val ) as (
	select 1 as val
	union
	select val +1 from counter where val < 10
)
select * from counter;

with recursive multiplication_table(num_base, num_counter, total) as (
	select 5 as num_base, 1 as num_counter, 5 as total
	union
	select 5 as num_base, num_counter + 1, (num_counter + 1) * num_base from multiplication_table where num_counter < 20
) select num_base, num_counter, total from multiplication_table;

with recursive multiplication_table() as (
	select 5 as num_base, 1 as num_counter, 5 as total
	union
	select 5 as num_base, num_counter + 1, (num_counter + 1) * num_base from multiplication_table where num_counter < 20
) select num_base, num_counter, total from multiplication_table;

with recursive multiplication_table(num_base, num_counter, total) as (
	values(5,1,5)
	union
	select 5 as num_base, num_counter + 1, (num_counter + 1) * num_base from multiplication_table where num_counter < 20
) select num_base, num_counter, total from multiplication_table;


select * from employees e  where reports_to = 1
union 
select * from employees e2 where reports_to in (2,3);


with recursive bosses as (
	select id, name, reports_to from employees where id = 5
	union
	select e.id, e.name, e.reports_to from employees e
		inner join bosses on bosses.id = e.reports_to
)
select * from bosses;

-- id	name	            reports_to
--  5	gerente melissa	  3
--  7	subgerente ramiro	  5
--  8	programador fernando	  7
--  9	programador javier	  7
--  11	junio nube	  9

with recursive bosses as (
	select id, name, reports_to, 1 as depth from employees where id = 1
	union
	select e.id, e.name, e.reports_to, depth + 1 from employees e
		inner join bosses on bosses.id = e.reports_to
	where depth < 4
)
select * from bosses;

with recursive bosses as (
	select id, name, reports_to, 1 as depth from employees where id = 1
	union
	select e.id, e.name, e.reports_to, depth + 1 from employees e
		inner join bosses on bosses.id = e.reports_to
	where depth < 10
)
select bosses.*, employees.name as report_name from bosses 
	left join employees 
	on employees.id = bosses.reports_to
	order by depth;

-- followers without cte recursive
	select f.id, f.leader_id, leader."name" as leader, f.follower_id, follower."name" as follower from followers f
inner join "user" leader  
on f.leader_id = leader.id 
inner join "user" follower 
on f.follower_id = follower.id ;

-- followers id 1
select f.follower_id from followers f where f.leader_id = 1;

-- follers id 2-3
select * from followers f 
where leader_id in ( select f.follower_id from followers f where f.leader_id = 1 );

