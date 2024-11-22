-- memory table
WITH recursive countdown( val ) as (
--	initialization => first level or init values
--values(5)
select 5 as val
union
-- query recursive
select val - 1 from countdown where val > 1
)
-- select fields
select * from countdown;