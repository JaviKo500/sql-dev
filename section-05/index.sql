select * from country c ;


create unique index "unique_country_name" on country(
	name
);

create index "country_continent" on country(
	continent
);

-- composite index
create unique index "unique_name_country_code_distric"  on city (
	name, countrycode, district
);
