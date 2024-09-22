select a."name" as country  from country a
inner join continent c
on a.continent = c.code 
order by a.name  asc ;
