select * from genero;

select * from pelicula order by id asc limit 0,10;
select * from pelicula order by id asc limit 10,10;
select * from pelicula order by id asc limit 20,10;

select * from pelicula order by titulo asc limit 0,52; 	
select * from pelicula order by titulo asc limit 52,52; 
select * from pelicula order by titulo asc limit 104,52; 
select * from pelicula order by titulo asc limit 728,52;

SELECT count(*) as Cantidad from pelicula;
select * from pelicula order by titulo asc limit 52;

-- ordenar por 
select * from pelicula order by titulo asc;
select * from pelicula order by anio desc;
select * from pelicula order by puntuacion desc;

-- filtros individuales
select * from pelicula where titulo like '%men%' order by titulo asc;
select * from pelicula where titulo like '%men%' order by anio desc;
select * from pelicula where titulo like '%men%' order by puntuacion desc;
select * from pelicula where anio = 2005 order by titulo asc;
select * from pelicula where anio = 2005 order by puntuacion desc;
select * from pelicula where genero_id = 1 order by titulo asc;
select * from pelicula where genero_id = 1 order by anio desc;
select * from pelicula where genero_id = 1 order by puntuacion desc;

-- filtros combinados
select * from pelicula where titulo like '%men%' and genero_id = 5 order by titulo asc;
select * from pelicula where titulo like '%men%' and genero_id = 5 order by anio desc;
select * from pelicula where titulo like '%men%' and genero_id = 5 order by puntuacion desc;
select * from pelicula where anio = 2006 and genero_id = 1 order by titulo asc; 
select * from pelicula where titulo like '%men%' and anio = 2006 order by titulo asc;
select * from pelicula where titulo like '%men%' and genero_id = 1 and anio = 2006 order by titulo asc;

-- Informacion de pelicula
SELECT P.*, G.nombre as genero, A.nombre as actores FROM pelicula P 
INNER JOIN genero G ON P.genero_id = G.id
INNER JOIN actor_pelicula AP ON P.id = AP.pelicula_id
INNER JOIN actor A ON AP.actor_id = A.id
WHERE P.id = 229; 

-- Recomendaciones

-- Estreno y Cualquiera
select * from pelicula where anio between 2006 and 2020 order by titulo;
-- Estreno y Genero
select P.*, G.nombre as genero from pelicula P
inner join genero G on P.genero_id = G.id
where P.anio between 2005 and 2020 and G.nombre = 'Biography' order by titulo;

-- Clásico y Cualquiera
select * from pelicula where anio between 1900 and 2005 order by anio desc; 
-- Clasico y Genero
select P.*, G.nombre as genero from pelicula P
inner join genero G on P.genero_id = G.id
where P.anio between 1900 and 2005 and G.nombre = 'Action' order by P.anio desc;

-- Puntuacion y Cualquiera
select * from pelicula where puntuacion = 7;
-- Puntuacion y Genero
select P.*, G.nombre as genero from pelicula P 
inner join genero G on P.genero_id = G.id
where P.puntuacion = 5 and G.nombre = 'Drama'; 

-- Cualquiera y Genero
select P.*, G.nombre as genero from pelicula P 
inner join genero G on P.genero_id = G.id
where G.nombre = 'Drama' order by P.anio desc;  

-- Cualquiera y Cualquiera
select * from pelicula;