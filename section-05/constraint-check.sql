select * from country c ;


alter table country 
	add check(
		surfacearea >=0
	);
	


select distinct continent from country c ;

alter table country 
	add check(
			(continent = 'Asia') or
			(continent = 'South America') or
			(continent = 'North America') or
			(continent = 'Oceania') or
			(continent = 'Antarctica') or
			(continent = 'Africa') or
			(continent = 'Europe') or
	);