var con = require('../lib/conexionbd');

function buscarPeliculas(req, res) {
    var titulo = req.query.titulo;
    // var genero = req.query.genero;
    // var orden = req.query.orden;
    var anio = req.query.anio;
    if(titulo || anio){
        var sql = "select * from pelicula where titulo = '" + titulo + "'" + 'and' + ' anio = ' + anio;
    }
    else{
        var sql = "select * from pelicula"
    }
    // la funcion de callback se ejecuta una vez que se termine de ejecutar la consulta
    con.query(sql, function(error, resultado, fields) {
        if (error) {
            console.log("Hubo un error en la consulta", error.message);
            return res.status(404).send("Hubo un error en la consulta");
        }
        var respuesta = {
            'peliculas': resultado
        };

        res.send(JSON.stringify(respuesta));
    });
    
}


// function buscarCancion(req, res) {
//     var id = req.params.id;
//     var sql = "select * from cancion where id = " + id;
//     con.query(sql, function(error, resultado, fields) {
//         if (error) {
//             console.log("Hubo un error en la consulta", error.message);
//             return res.status(404).send("Hubo un error en la consulta");
//         }
//         if (resultado.length == 0) {
//             console.log("No se encontro ninguna cancion con ese id");
//             return res.status(404).send("No se encontro ninguna cancion con ese id");
//         } else {
//             var respuesta = resultado[0];
            
//             res.send(respuesta);
//         }

//     });
// }

module.exports = {
    buscarPeliculas: buscarPeliculas
    // buscarCancion: buscarCancion
};