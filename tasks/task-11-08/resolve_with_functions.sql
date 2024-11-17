

create or replace function comment_replies( id integer)
returns json
as
$$
declare result json;
begin
	select 
	json_agg( json_build_object(
	  'user', comments.user_id,
	  'comment', comments.content
	)) into result
from comments where comment_parent_id = id;
return result;
end;
$$
language plpgsql;

create or replace function sayHello( user_name varchar )
returns varchar
as
$$
begin
	return 'Hello ' || user_name;
end;
$$
language plpgsql;

select sayHello(u.name ) from users u  ;

select comment_replies( 1 );

select 
c.*,
comment_replies( c.comment_id ) as replies
from "comments" c where c.comment_parent_id is null; 