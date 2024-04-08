// Author: @PabloACespedes
// Manejo de errores en oracle APEX JS
// Documentation link: https://docs.oracle.com/en/database/oracle/application-express/20.1/aexjs/apex.message.html#.showErrors
var error = {};

/**
 * @item {string} item - Nombre del item
 * @msg {string} msg - msg de error
 */
error.item = function ({item, msg}) {
    apex.message.clearErrors();

    apex.message.showErrors({
        type: "error",
        location: "inline",
        pageItem: item,
        message: msg,
        unsafe: true
    });
}

/*
* @msg {string} msg - msg de error
  Se utiliza a nivel de pagina
*/
error.page = function ({msg}) {
    apex.message.clearErrors();

    apex.message.showErrors({
        type: "error",
        location: "page",
        message: msg,
        unsafe: true
    });
}

/**
 * 
 * @param items {Array} - Array de objetos con los siguientes atributos
 * Estructura {itemName: "P1_ITEM", msg: "Complete este campo"},
 *            {itemName: "P2_ITEM", msg: "Complete este campo"},     
 */
error.items = function (items){
  apex.message.clearErrors();

  let errors = []; 

  for ( const item in items ){
    errors.push({
        type:       "error",
        location:   "inline",
        pageItem:   items[item].itemName,
        message:    items[item].msg,
        unsafe:     true
    });
  }

  apex.message.showErrors(errors);
}

export { error };