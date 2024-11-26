select * from employees e ;

select greatest (1,2,3,4,30);

select coalesce (null, 'hellow world');

create or replace function greet_employee( empl_name varchar )
returns varchar
as $$
-- declare
begin
	return 'Hello world ' || empl_name;
end;
$$
language plpgsql;

select greet_employee('javiko500');

select e.first_name, greet_employee(e.first_name) from employees e ;