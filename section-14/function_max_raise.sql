select * from jobs;

select employee_id, first_name, salary, max_salary, 
max_salary - salary as possible_raise from employees e 
inner join jobs on jobs.job_id  = e.job_id ;

create or replace function max_raise( empl_id int )
returns numeric(8,2)
as $$
declare
	possible_raise numeric(8,2);
begin
	select max_salary - salary into possible_raise from employees e
	inner join jobs on jobs.job_id  = e.job_id
	where employee_id = empl_id;
	return possible_raise;
end
$$
language plpgsql;

select max_raise(206);

select * from jobs;

select employee_id, first_name, salary, max_salary, 
max_salary - salary as possible_raise from employees e 
inner join jobs on jobs.job_id  = e.job_id ;

create or replace function max_raise_2( empl_id int )
returns numeric(8,2)
as $$
declare
	employee_job_id int;
	current_salary numeric(8,2);
	job_max_salary numeric(8,2);
	possible_raise numeric(8,2);
begin
--	get postion jon and salary
	select job_id, salary into employee_job_id, current_salary from employees e
	where employee_id = empl_id;
-- get max salary by position
	select max_salary into job_max_salary from jobs where job_id = employee_job_id;

-- operation
	possible_raise = job_max_salary - current_salary;
	return possible_raise; 
end
$$
language plpgsql;


select employee_id, first_name, salary, max_salary, 
max_salary - salary as possible_raise, max_raise( employee_id ), max_raise_2(employee_id) from employees e 
inner join jobs on jobs.job_id  = e.job_id ;

create or replace function max_raise_2( empl_id int )
returns numeric(8,2)
as $$
declare
	employee_job_id int;
	current_salary numeric(8,2);
	job_max_salary numeric(8,2);
	possible_raise numeric(8,2);
begin
--	get postion jon and salary
	select job_id, salary into employee_job_id, current_salary from employees e
	where employee_id = empl_id;
-- get max salary by position
	select max_salary into job_max_salary from jobs where job_id = employee_job_id;

-- operation
	possible_raise = job_max_salary - current_salary;
	if ( possible_raise < 0 ) then
--	return 0;
	raise exception 'person with salary mayor a max_salary: %', current_salary;
	end if;
	return possible_raise; 
end
$$
language plpgsql;
