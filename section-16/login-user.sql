create extension pgcrypto;

insert into "user" ( username, "password" )
values('pablo', crypt( '123456', gen_salt('bf')));



select * from "user" u;


select * from "user" u where username = 'javiko500' and "password" = crypt('123456',"password" );