select domain, total from ( select count(*) as total, substring( email, position( '@' in email ) + 1 )  as domain, 'Javiko500' as name, 26 as age
	from users u 
	group by substring( email, position( '@' in email ) + 1 )
	having count(*) > 1
	order by substring( email, position( '@' in email ) + 1 ) asc) as email_domains;
