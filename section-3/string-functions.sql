select
	id,
	upper(name)
from
	users u ;

select
	id,
	lower(name) as "Lower name"
from
	users u ;

select
	id,
	concat(name,
	' - ' ,
	id),
	length(name) as user_name,
	(20 * 2) as constante,
	'*'||id||'-'||"name" || '*' as barcode
from
	users u ;
	

