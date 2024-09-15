select * from country c ;

select distinct continent from country c order by continent asc;

create table "continent" (
	code serial not null,
	name text not null,
	primary key (code)
);

-- insert anme by select
insert into continent (name) ( select distinct continent from country c order by continent asc );

select * from continent c ;