
  select first_name , last_name , followers 
   	from users u where followers = 4 or followers = 4999;
   	
  select count(*) 
   	from users u where  followers = 4999;
   	
 select count(*), followers
  	from users u 
 	where followers between 4500 and 4999
 	group by followers
 	order by followers  desc;

select email, substring( email, position( '@' in email ) + 1 )  as domain
	from users u;
-- output myrtie.powell@elbafla.kn elbafla.kn
select count(*), substring( email, position( '@' in email ) + 1 )  as domain
	from users u 
	group by substring( email, position( '@' in email ) + 1 )
	having count(*) > 1
	order by substring( email, position( '@' in email ) + 1 ) asc ;

   