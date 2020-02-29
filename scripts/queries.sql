select * from genero;
select * from pelicula order by titulo asc limit 1,10;

-- ordenar por 
select * from pelicula order by titulo asc;
select * from pelicula order by anio desc;
select * from pelicula order by puntuacion desc;

-- filtros individuales
select * from pelicula where titulo like '%love%' order by titulo asc;
select * from pelicula where anio = 2005 order by titulo asc;
select * from pelicula where genero_id = 1 order by titulo asc;
select * from pelicula where genero_id = 1 order by anio desc;
select * from pelicula where genero_id = 1 order by puntuacion desc;

-- filtros combinados
select * from pelicula where titulo like '%pirates%' and genero_id = 1 order by titulo asc; -- no funciona en el front
select * from pelicula where anio = 2006 and genero_id = 1 order by titulo asc; -- no funciona en el front
