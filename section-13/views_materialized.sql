create materialized view comments_per_week_mat as
select date_trunc('week', p.created_at) as weeks, 
	count( distinct p.post_id ) as number_of_posts,
	sum(c.counter) as total_claps
	from posts p
	inner join claps c on c.post_id  = p.post_id 
	group by weeks 
	order by weeks desc;


select * from comments_per_week cpw ;

select * from comments_per_week_mat cpwm ;

refresh materialized view comments_per_week_mat ;

select * from posts p where p.post_id =1;

alter view post_per_weeks rename to post_per_weew;