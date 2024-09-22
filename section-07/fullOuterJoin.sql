-- country a - name , continent ( code )
-- continent b - name as continent name

select a.name as country, a.continent as "Contient code", b."name" as "Continent name" from country a 
	full outer join continent b
	on a.continent = b.code 
order by a.name desc;