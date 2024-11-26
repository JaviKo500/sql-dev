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