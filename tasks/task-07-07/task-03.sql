-- language official by continent

select * from countrylanguage c where isofficial = true;
select * from country c ;

select * from continent c ; 

select count(*) as total, continent from (
	select distinct a.language, c."name" as continent from countrylanguage a
		inner join country b on a.countrycode = b.code
		inner join continent c on b.continent = c.code 
		where a.isofficial = true
) as totals
group by continent
order by total;


select distinct a.language, c."name" as continent from countrylanguage a
		inner join country b on a.countrycode = b.code
		inner join continent c on b.continent = c.code 
		where a.isofficial = true;
	
select distinct language."name", continent."name" as continent from countrylanguage countrylanguage
		inner join country country on countrylanguage.countrycode = country.code
		inner join continent continent on country.continent = continent.code 
		inner join "language" language on countrylanguage.languagecode =  language.code 
		where countrylanguage.isofficial = true;