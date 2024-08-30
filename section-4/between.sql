select * from users;

select first_name, last_name, "followers" from users where "followers" > 4600 and  "followers" < 4700 order by "followers" asc;
select first_name, last_name, "followers" from users where "followers" > 4600 and  "followers" < 4700 order by "followers" desc;
select first_name, last_name, "followers" from users where "followers" between  4600 and  4700 order by "followers" desc;


