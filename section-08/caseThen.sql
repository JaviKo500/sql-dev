select hire_date from employees e ;


select  first_name, last_name, hire_date,
	case 
		when hire_date > now() - interval '2 year' then '1 year o less'
		when hire_date > now() - interval '3 year' then '1 to 3 years'
		when hire_date > now() - interval '5 year' then '1 to 6 years'
		else '+ than 6 year'
	end as range_past
	from employees e ;


