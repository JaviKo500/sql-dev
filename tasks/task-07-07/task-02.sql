-- get country with grated cities
select count(*) as total, b."name" as country from city a
	inner join country b
	on a.countrycode = b.code 
	group by b."name" 
	order by total desc
	limit 1;