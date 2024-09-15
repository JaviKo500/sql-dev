select * from country c ;


create unique index "unique_country_name" on country(
	name
);

create index "country_continent" on country(
	continent
);