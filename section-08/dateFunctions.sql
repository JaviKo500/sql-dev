select now(), 
	current_date, 
	current_time, 
	current_user, 
	date_part( 'hours', now() ) as hours,
	date_part( 'minutes', now() ) as minutes,
	date_part( 'seconds', now() ) as seconds,
	date_part( 'days', now() ) as days,
	date_part( 'months', now() ) as months,
	date_part( 'years', now() ) as years
	; 

select * from employees e 
	where hire_date > '1998-02-05'
	order by hire_date;
select * from employees e 
	where hire_date > date('1998-02-05')
	order by hire_date;


select max(hire_date) as more_new,
	min(hire_date) as firs_employe
	from employees e;

select * from employees e
	where  hire_date  between '1990-01-01' and '2000-01-01';

