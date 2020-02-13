var con = require('../lib/conexionbd');

function buscarPeliculas(req, res) {
    // var orden_array = orden.split("-");
    // query_params.columna_orden = orden_array[0];
    // query_params.tipo_orden = orden_array[1];
    // var query = $.param(query_params);
    // Request URL: http://localhost:8080/peliculas?pagina=1&titulo=love&cantidad=52&columna_orden=titulo&tipo_orden=ASC

    var titulo = req.query.titulo;
    var columna_orden = req.query.columna_orden;
    var tipo_orden = req.query.tipo_orden;
    var pagina = req.query.pagina;
    // var cantidad = req.query.cantidad;
    // var genero = req.query.genero;
    // var anio = req.query.anio;

    if(titulo){
        var sql = "select * from pelicula where titulo like '" + '%' + titulo + '%' + "'" + ' order by ' + columna_orden + ' ' + tipo_orden;
    }
    else{
        var sql = "select * from pelicula order by " + columna_orden + ' ' + tipo_orden + ' ' + 'limit ' + pagina + ',' + '10';
    }
    // la funcion de callback se ejecuta una vez que se termine de ejecutar la consulta
    con.query(sql, function(error, resultado, fields) {
        if (error) {
            console.log("Hubo un error en la consulta", error.message);
            return res.status(404).send("Hubo un error en la consulta");
        }
        
        // var sqlCount = "select COUNT(*) from pelicula";

        // con.query(sqlCount, function(error, resultado) {
        //     if (error) {
        //         console.log("Hubo un error al calcular la cantidad", error.message);
        //         return res.status(404).send("Hubo un error al calcular la cantidad");
        //     }  
            
        //     var respuesta = {
        //         'total': resultado[0]
        //     };

        //     res.send(JSON.stringify(respuesta));
        // });

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