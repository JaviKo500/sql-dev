select a.name, a.continent, b.name from country a
	right join continent b
	on a.continent = b.code 
	where a.continent is null;