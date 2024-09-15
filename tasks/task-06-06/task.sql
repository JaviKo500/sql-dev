

-- Tarea con countryLanguage

-- Crear la tabla de language

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS language_code_seq;


-- Table Definition
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT 	nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- Crear una columna en countrylanguage
ALTER TABLE countrylanguage
ADD COLUMN languagecode varchar(3);


-- Empezar con el select para confirmar lo que vamos a actualizar

select language from countrylanguage c ;

select distinct "language" from countrylanguage c ;

insert into "language" ( name ) ( select distinct "language" from countrylanguage );
-- Actualizar todos los registros

select c.language,
	(select b.name from "language" b where b.name = c.language )
	from countrylanguage c;

update countrylanguage a 
	set languagecode =(select b.code from "language" b where b.name = a.language ); 

-- Cambiar tipo de dato en countrylanguage - languagecode por int4

alter table countrylanguage 
alter column languagecode type int4
using languagecode::integer;

-- Crear el forening key y constraints de no nulo el language_code
alter table countrylanguage 
	add constraint fk_language_code
	foreign key ( languagecode )
	references language(code);
-- Revisar lo creado

