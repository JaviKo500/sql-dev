select * from users u ;

select name, substring( name, 0, position(' ' in name ) ) from users u ;

select
	"name" ,
	substring( name, 0, position(' ' in name ) ),
	substring( name, 0, position(' ' in name ) ) as "First name",
	substring( name, position(' ' in name ) + 1, length(name)) as "Last name",
	trim( substring( name, position(' ' in name ) + 1, length(name))) as "Trim last name"
from
	users u ;
