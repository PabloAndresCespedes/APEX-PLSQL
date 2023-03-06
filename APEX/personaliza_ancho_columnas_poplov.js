/*
Dentro de las propiedades del POP LOV >> en la parte de Inicialización de Javascript 
colocamos el siguiente fragmento de codigo

Para mas tips y conocimientos de agrupacion se puede:
Autor: @Jon Dixon Dec 1, 2022
https://blog.cloudnueva.com/apex-popup-lov-deep-dive
*/

// aqui recibimos el objeto OPTIONS donde contiene las propiedades de columna y establecemos el nombre
// de la columna del select del POP LOV
((options)=>{
    options.columns.NAME.width = '60%';
    return options;
})

// opcion de columnas dos
((options) => { 
    var col, columns = options.columns;
    options.minWidth = 800;
    col = columns.EMISION;
    col.width = 100;
    col = columns.NRO;
    col.width = 100;
    col = columns.RAZON_SOCIAL;
    col.width = 300;
    col = columns.RUC;
    col.width = 100;
    col = columns.MOTIVO;
    col.width = 200;
    return options;
}
)

// opcion 3 
function(options) {
    var col, columns = options.columns;
    options.minWidth = 650;
    col = columns.HOL_CODIGO;
    col.width = 100;
    col = columns.HOL_DESC;
    col.width = 550;
    return options;
}
