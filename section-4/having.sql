
select count(*), country
	from users u
	group by country
	having count(*) > 5
	order by count(*)  desc; 
	
  
select count(*), country
	from users u
	group by country
	having count(*) between 2 and 6 
	order by count(*)  desc; 