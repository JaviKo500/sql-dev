
CREATE OR REPLACE FUNCTION max_raise( empl_id int )
returns NUMERIC(8,2) as $$

DECLARE
	possible_raise NUMERIC(8,2);

BEGIN
	
	select 
		max_salary - salary into possible_raise
	from employees
	INNER JOIN jobs on jobs.job_id = employees.job_id
	WHERE employee_id = empl_id;

	if ( possible_raise < 0 ) THEN
		possible_raise = 0;
	end if;

	return possible_raise;

END;
$$ LANGUAGE plpgsql;

select max_raise(e.employee_id), e.salary, e.job_id from employees e ;

select current_date as "date",
salary,
max_raise( e.employee_id ),
max_raise( e.employee_id ) * 0.01 as amount,
e.salary + (max_raise( e.employee_id ) * 0.01) as total,
'1%' as percentage
from employees e;


-- output
-- 2024-11-27	24000.00	16000.00	160.0000	24160.0000	1%
-- 2024-11-27	17000.00	13000.00	130.0000	17130.0000	1%
-- 2024-11-27	17000.00	13000.00	130.0000	17130.0000	1%
-- 2024-11-27	9000.00	1000.00	10.0000	9010.0000	1%
-- 2024-11-27	6000.00	4000.00	40.0000	6040.0000	1%
-- 2024-11-27	4800.00	5200.00	52.0000	4852.0000	1%
-- 2024-11-27	4800.00	5200.00	52.0000	4852.0000	1%
-- 2024-11-27	4200.00	5800.00	58.0000	4258.0000	1%
