create or replace procedure insert_region_proc(int, varchar)
as $$
begin
	insert into regions( region_id, region_name )
	values( $1, $2 );

	raise notice 'Variable 1: %, %', $1, $2;	

--	rollback;
	commit;
end;
$$ language plpgsql;

call insert_region_proc(5, 'Cetral america');

select * from regions r ;

create or replace procedure controlled_raise( percentage numeric )
as $$
declare
	amount numeric(8,2);
	real_percentage numeric(8,2);
	total_employees int;
begin
	real_percentage = percentage / 100;

	-- matener el historico
	insert into raise_history( date, employee_id, base_salary, amount, percentage )
	select current_date as "date",
			e.employee_id ,
			e.salary,
			max_raise( e.employee_id ) * real_percentage as amount,
			percentage
		  from employees e;
	
	update employees set salary =  ( max_raise( employee_id ) * real_percentage )+ salary;

	raise notice 'percentage: %', percentage;

	select count(*) into total_employees from employees;
	raise notice 'percentage - employees: %, %', percentage, total_employees;
	commit;
end;
$$ language plpgsql;

call controlled_raise(1);