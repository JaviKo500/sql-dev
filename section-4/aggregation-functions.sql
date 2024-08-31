select * from users;

select count(*) as total_user from users u ;

select min( followers ) as min_followers from users u;
select max( followers ) as man_followers from users u;

select avg(followers )  from users u;
select round (avg(followers ))  from users u;

