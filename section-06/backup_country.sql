select * from country c ;


CREATE TABLE public.country_old (
	code bpchar(3) NOT NULL,
	"name" text NOT NULL,
	continent text NOT NULL,
	region text NOT NULL,
	surfacearea float4 NOT NULL,
	indepyear int2 NULL,
	population int4 NOT NULL,
	lifeexpectancy float4 NULL,
	gnp numeric(10, 2) NULL,
	gnpold numeric(10, 2) NULL,
	localname text NOT NULL,
	governmentform text NOT NULL,
	headofstate text NULL,
	capital int4 NULL,
	code2 bpchar(2) NOT NULL,
	CONSTRAINT country_old_continent_check3 CHECK (((continent = 'Asia'::text) OR (continent = 'South America'::text) OR (continent = 'North America'::text) OR (continent = 'Oceania'::text) OR (continent = 'Antarctica'::text) OR (continent = 'Africa'::text) OR (continent = 'Central America'::text) OR (continent = 'Europe'::text))),
	CONSTRAINT country_old_pkey PRIMARY KEY (code),
	CONSTRAINT country_old_surfacearea_check CHECK ((surfacearea >= (0)::double precision))
);

insert into country_old ( select * from country );

select  * from country_old co ;


alter table country  drop constraint country_continent_check;