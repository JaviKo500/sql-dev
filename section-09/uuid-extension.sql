
create extension if not exists "uuid-ossp";
drop extension "uuid-ossp";

select gen_random_uuid(), uuid_generate_v4(), uuid_generate_v1();

create table "users5"(
	"user_id" UUID DEFAULT uuid_generate_v4() primary key,
	"username" varchar
);
