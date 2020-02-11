CREATE TABLE `que_veo_hoy`.`pelicula` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `duracion` INT NOT NULL,
  `director` VARCHAR(400) NOT NULL,
  `anio` INT NOT NULL,
  `fecha_lanzamiento` DATE NOT NULL,
  `puntuacion` INT NOT NULL,
  `poster` VARCHAR(300) NOT NULL,
  `trama` VARCHAR(700) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `que_veo_hoy`.`genero` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);

alter table pelicula add column genero_id int;

alter table pelicula add foreign key (genero_id) references genero(id);

show create table pelicula;
+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table    | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| pelicula | CREATE TABLE `pelicula` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `duracion` int NOT NULL,
  `director` varchar(400) NOT NULL,
  `anio` int NOT NULL,
  `fecha_lanzamiento` date NOT NULL,
  `puntuacion` int NOT NULL,
  `poster` varchar(300) NOT NULL,
  `trama` varchar(700) NOT NULL,
  `genero_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genero_id` (`genero_id`),
  CONSTRAINT `pelicula_ibfk_1` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=744 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
