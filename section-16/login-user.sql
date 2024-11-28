create extension pgcrypto;

insert into "user" ( username, "password" )
values('pablo', crypt( '123456', gen_salt('bf')));



select * from "user" u;


select * from "user" u where username = 'javiko500' and "password" = crypt('123456',"password" );

create or replace procedure user_login( user_name varchar, user_password varchar)
as $$
declare
 was_found boolean;
begin
	select count(*) into was_found from "user" u where username = user_name and "password" = crypt( user_password ,"password" );
	
	if ( was_found = false ) then
		insert into session_failed ( username, "when" ) values( user_name, now() );
		commit; 
		raise exception 'invalid user credentials';
	end if;
	update "user" set last_login = now() where username = user_name;
	raise notice 'user found: %', was_found;
	commit;
end;
$$ language plpgsql;

call user_login('javiko500', '123456 ');