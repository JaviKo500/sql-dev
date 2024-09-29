select hire_date from employees e ;

select hire_date,
	make_interval( YEARS := 2024 - extract( YEARS from hire_date )::integer) as manual,
	make_interval( YEARS := date_part('years', current_date)::integer - extract( YEARS from hire_date )::integer) as computed
	from employees e 
	order by hire_date desc;


select hire_date,
	hire_date + interval '23 years'
	from employees e 
	order by hire_date desc;
	
update employees 
	set  hire_date = hire_date + interval '23 years';
