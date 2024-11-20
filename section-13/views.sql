create view comments_per_week as
select date_trunc('week', p.created_at) as weeks, 
	count( distinct p.post_id ) as number_of_posts,
	sum(c.counter) as total_claps
	from posts p
	inner join claps c on c.post_id  = p.post_id 
	group by weeks 
	order by weeks desc;

create or replace view comments_per_week as
select date_trunc('week', p.created_at) as weeks, 
	count( distinct p.post_id ) as number_of_posts,
	sum(c.counter) as total_claps
	from posts p
	inner join claps c on c.post_id  = p.post_id 
	group by weeks 
	order by weeks desc;

select * from posts where post_id = 1;

select * from comments_per_week cpw ;

-- delete view
drop view comments_per_week ;