var con = require('../lib/conexionbd');

function buscarPeliculas(req, res) {
    var titulo = req.query.titulo;
    // var genero = req.query.genero;
    // var orden = req.query.orden;
    // var anio = req.query.anio;
    if(titulo){
        var sql = "select * from pelicula where titulo like '" + '%' + titulo + '%' + "'" + 'order by titulo';
    }
    else{
        var sql = "select * from pelicula order by titulo limit 10";
    }
    // la funcion de callback se ejecuta una vez que se termine de ejecutar la consulta
    con.query(sql, function(error, resultado, fields) {
        if (error) {
            console.log("Hubo un error en la consulta", error.message);
            return res.status(404).send("Hubo un error en la consulta");
        }
        
        var sqlCount = "select COUNT(*) from pelicula";

        con.query(sqlCount, function(error, resultado) {
            if (error) {
                console.log("Hubo un error al calcular la cantidad", error.message);
                return res.status(404).send("Hubo un error al calcular la cantidad");
            }  
            
            var respuesta = {
                'total': resultado[0]
            };

            res.send(respuesta);
        });

        var respuesta = {
            'peliculas': resultado
        };

        res.send(JSON.stringify(respuesta));
    });
    
}


function buscarGeneros(req, res) {
    var id = req.params.id;

    if(id){
        var sql = "select * from genero where id = " + id;
    }
    else{
        var sql = "select * from genero";
    }
    con.query(sql, function(error, resultado, fields) {
        if (error) {
            console.log("Hubo un error en la consulta", error.message);
            return res.status(404).send("Hubo un error en la consulta");
        }
        var respuesta = {
            'generos': resultado
        };
            
        res.send(JSON.stringify(respuesta));
    });
}

module.exports = {
    buscarPeliculas: buscarPeliculas,
    buscarGeneros: buscarGeneros
};