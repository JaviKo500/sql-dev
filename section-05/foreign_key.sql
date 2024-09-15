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
	