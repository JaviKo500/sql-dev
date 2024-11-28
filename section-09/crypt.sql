create extension pgcrypto;

insert into "user" ( username, "password" )
values('javiko500', crypt( '123456', gen_salt('bf')));



select * from "user" u;