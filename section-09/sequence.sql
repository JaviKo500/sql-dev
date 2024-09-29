create sequence user_sequence;
drop sequence user_sequence;

-- next value and use
select nextval('user_sequence');

-- see next value
select  currval('user_sequence');

create table user6(
	"user_id" integer primary key default nextval('user_sequence'),
	"username" varchar
);
