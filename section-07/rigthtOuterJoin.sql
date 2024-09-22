select a.name, a.continent, b.name from country a
	right join continent b
	on a.continent = b.code 
	where a.continent is null;

    select count(*), b."name" from country a
	inner join continent b
	on a.continent  = b.code
	group by b.name
	order  by count(*) asc;
	
	
(select count(*) as total, b."name" from country a
	inner join continent b
	on a.continent  = b.code
	group by b.name)
union
(select 0 as total, b."name" from country a
	right outer join continent b
	on a.continent  = b.code
	where a.continent is null
	group by b.name
)
order by total asc;