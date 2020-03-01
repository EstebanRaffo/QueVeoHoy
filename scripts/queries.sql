select * from genero;

select * from pelicula order by id asc limit 0,10;
select * from pelicula order by id asc limit 10,10;
select * from pelicula order by id asc limit 20,10;

select * from pelicula order by titulo asc limit 0,52; 	-- pagina 1 (pagina * cantidadPorPagina - cantidadPorPagina)
select * from pelicula order by titulo asc limit 52,52; -- pagina 2 (pagina * cantidadPorPagina - cantidadPorPagina)
select * from pelicula order by titulo asc limit 104,52; -- pagina 3 (pagina * cantidadPorPagina - cantidadPorPagina)

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