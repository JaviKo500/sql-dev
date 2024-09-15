select * from city c ;


select * from country where code = 'AFG';
alter table city 
	add constraint fk_country_code
	foreign key ( countrycode )
	references country(code);
	
INSERT INTO country
		values('AFG', 'Afghanistan', 'Asia', 'Southern Asia', 652860, 1919, 40000000, 62, 69000000, NULL, 'Afghanistan', 'Totalitarian', NULL, NULL, 'AF');

alter table "course-db".public.countrylanguage 
	add constraint fk_country_code
	foreign key ( countrycode )
	references country(code);

-- update type column and set foreign key
alter table country 
alter column continent type int4
using continent::integer;

alter table country 
	add constraint fk_continent_code
	foreign key ( continent )
	references continent(code);
	