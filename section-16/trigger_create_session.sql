

call user_login('javiko.500', '123456');

create or replace trigger create_session_trigger after update on "user"
for each row execute procedure create_session_log();

create or replace function create_session_log()
returns trigger 
as $$
begin
	insert into "session" (user_id, last_login) values( new.id, now() );
	return new; 
end;
$$ language plpgsql;



call user_login('javiko.500', '123456');

create or replace trigger create_session_trigger 
	after update on "user"
	for each row
	WHEN (OLD.last_login IS DISTINCT FROM NEW.last_login)
	execute function create_session_log();

create or replace function create_session_log()
returns trigger 
as $$
begin
	insert into "session" (user_id, last_login) values( new.id, now() );
	return new; 
end;
$$ language plpgsql;

