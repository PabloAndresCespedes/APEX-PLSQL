// al realizar un cambio se puede utilizar el dato del atributo con .data
// el elemento HTML es un boton con el atributo data-task-id
// JS convierte el formato a Camelcase
$(this.triggeringElement).data('taskId');

/**
 * obtener datos en base a un evento click dentro de una region
 * Generar una region con static id regListaTecnicos
 * utilizar una columna con un tag HTML similar al siguiente
 *   <span class="fa fa-times-circle u-danger-text cursor deleteTec" aria-hidden="true" data-tecnico-id="#ID#"></span>
 * Donde la clase deleteTec y el atributo data-tecnico-id esten por cada registro y en el mismo nivel
 * el atributo data-tecnico-id aloja el id de registro   
*/ 

var regLista = 'regListaTecnicos';
// 1. Escuchamos todos los clicks de la region 
// enviando la clase del elemento SPAN de la region
$(`#${regLista}`).on('click', ".deleteTec", function() {
    //2. Obtenemos el valor de "data-tecnico-id", con ".data"
    let idTecnico = $(this).data("tecnicoId");
    //3. Este es un AJAX APEX, que llama un proceso de remover elemento del listado, simplemente un DELETE sobre la tabla correspondiente
    apex.server.process('delTecnico',
          {
              x01: idTecnico,
              pageItems: '#P_EMPRESA'
          }
          , {success: function(pData){
                  // 4. En caso de que haya un error, retorna 1 
                  // el indicador de error, caso contrario 0, y realizar un refresh sobre la region de regListaTecnicos
                  if (pData.ind_error == 1){
                      alert(pData.error);
                  } else {
                     apex.region( regLista ).refresh();
                  }
              }
          }
      );
});