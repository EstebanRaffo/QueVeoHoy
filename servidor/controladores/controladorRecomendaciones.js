var con = require('../lib/conexionbd');

function recomendarPeliculas(req, res) {
    
    // query_params.genero = this.genero;
    // query_params.anio_inicio = this.anio_inicio;
    // query_params.anio_fin = this.anio_fin;
    // query_params.puntuacion = this.puntuacion;
    var genero = req.query.genero;
    var anio_inicio = req.query.anio_inicio;
    var anio_fin = req.query.anio_fin;
    var puntuacion = req.query.puntuacion;

    var sql = "select * from pelicula where id = " + id;
    
    con.query(sql, function(error, resultado, fields) {
        if (error) {
            console.log("Hubo un error en la consulta", error.message);
            return res.status(404).send("Hubo un error en la consulta");
        }
        if (resultado.length == 0) {
            console.log("No se encontro ningún nombre con ese id");
            return res.status(404).send("No se encontro ninguna pelicula con ese id");
        } else {
            var respuesta = {
                'peliculas': resultado[0]
            };

            // SELECT P.*, G.nombre as genero, A.nombre as actores FROM pelicula P 
            // INNER JOIN genero G ON P.genero_id = G.id
            // INNER JOIN actor_pelicula AP ON P.id = AP.pelicula_id
            // INNER JOIN actor A ON AP.actor_id = A.id
            // WHERE P.id = 1 

            res.send(JSON.stringify(respuesta));
        }

    });
}


module.exports = {
    recomendarPeliculas: recomendarPeliculas
};