select * from country c ;


alter table country 
	add check(
		surfacearea >=0
	);
	


select distinct continent from country c ;
select * from country c where code = 'CRI';

alter table country 
	add check(
			(continent = 'Asia') or
			(continent = 'South America') or
			(continent = 'North America') or
			(continent = 'Oceania') or
			(continent = 'Antarctica') or
			(continent = 'Central America') or
			(continent = 'Africa') or
			(continent = 'Europe') 
	);
alter table country drop CONSTRAINT "country_continent_check";