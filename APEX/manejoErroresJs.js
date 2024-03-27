// Author: @PabloACespedes
// Manejo de errores en oracle APEX JS
// Documentation link: https://docs.oracle.com/en/database/oracle/application-express/20.1/aexjs/apex.message.html#.showErrors

var error = {};

/**
 * @item {string} item - Nombre del item
 * @mensaje {string} mensaje - Mensaje de error
 */
error.item = function ({item, mensaje}) {
    apex.message.clearErrors();

    apex.message.showErrors({
        type: "error",
        location: ["item"],
        pageItem: item,
        message: mensaje,
        unsafe: false
    });

}

/*
* @mensaje {string} mensaje - Mensaje de error
  Se utiliza a nivel de pagina
*/
error.page = function ({mensaje}) {
    apex.message.clearErrors();

    apex.message.showErrors({
        type: "error",
        location: ["page"],
        message: mensaje,
        unsafe: false
    });
}

/**
 * 
 * @param items {Array} - Array de objetos con los siguientes atributos
 * Estructura {itemName: "P1_ITEM", mensajeError: "Complete este campo"},
 *            {itemName: "P2_ITEM", mensajeError: "Complete este campo"},     
 */
error.items = function (items){
  apex.message.clearErrors();

  let errors = []; 

  for ( const item in items){
    errors.push({
        type:       "error",
        location:   [ "inline" ],
        pageItem:   items[item].itemName,
        message:    items[item].mensajeError,
        unsafe:     false
    });
  }
  apex.message.showErrors(errors);
}