

select 
	max( hire_date ),
--	max( hire_date) + interval '1 days' as days,
--	max( hire_date) + interval '1 months' as months,
--	max( hire_date) + interval '1 year' as years,
	max( hire_date ) + interval '1 years' + interval '1 day' as years,
	date_part('year', now()),
--	make_interval(( YEARS := 23 ) 
	MAKE_INTERVAL( YEARS := date_part('year', now())::integer )
	from employees e ;