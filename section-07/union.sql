select * from continent where name like '%America%' 
union 
select * from continent where code in (3,5)
order by "name" asc ;