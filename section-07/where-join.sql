
select a.name country, b.name as continent 
from country a, continent b
where a.continent = b.code 
order by a.name asc;