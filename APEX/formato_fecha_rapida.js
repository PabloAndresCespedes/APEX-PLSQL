/**
 * PabloACespedes 15.03.2023 08:44 am
 * Funciones de formato y oyente de salida de input para los date pickers APEX
 * 
 */
function formatDate({date}){
  // hacemos uso de un CallBack en PLSQL que realiza el formateo, ver funcion en apartado PLSQL
  apex.server.process('formatDate',
    {
      x01: apex.item( date ).getValue()
    }
    , {success: function(pData){
         if (pData.ind_error == 1){
           apex.message.alert( pData.mensaje, () => apex.item( date ).setValue('') );
         } else {
           apex.item( date ).setValue( pData.l_fecha );
        }
       } 
      }
    );
}

// obtenemos el ID del item APEX cuando se sale del campo y formateamos los valores
$( '.datepicker' ).focusout( function () {
    formatDate({date: $(this).attr("id") });
} );