select country_id, country_name, r.region_name from countries c 
inner join regions r 
on c.region_id  = r.region_id;

create or replace function country_region()
returns table (id character(2), name varchar(40), region varchar(25))
as $$
begin
	return query 
		select country_id, country_name, r.region_name from countries c 
			inner join regions r 
			on c.region_id  = r.region_id;
end;
$$ language plpgsql;


select * from country_region();