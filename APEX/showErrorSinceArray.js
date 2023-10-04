// establecemos valores de arreglos
let aErrors = [];
let itemsEnvio =  ['P5001_SLN_SUCURSAL','P5001_SLN_RUC','P5001_SLN_DENOMINACION','P5001_SLN_CI','P5001_SLN_CATEGORIA','P5001_SLN_CLIENTE','P5001_SLN_VENDEDOR','P5001_SLN_OBS'];

// recorremos los items a validar
for (let item in itemsEnvio) {
    // comprobamos si esta vacio el item
    if (apex.item( itemsEnvio[item] ).isEmpty() ){
        // agregamos 
        aErrors.push({
        type:       "error",
        location:   [ "inline" ],
        pageItem:   itemsEnvio[item],
        message:    "Complete este campo",
        unsafe:     false
        });
    }
}

apex.message.clearErrors();

  if (aErrors.length > 0){
		apex.message.showErrors(aErrors);
  }else{
    apex.server.process('guardar_solicitud_lista_negra',
        {
            pageItems: itemsEnvio
        }
        , {success: function(pData){

                if (pData.ind_error == 1){
                    showSweet({ msg: pData.msg_error });
                } else {
                  apex.theme.closeRegion( REG_SOLICITUD );
                  apex.region( REG_RESULTADOS ).refresh();
                  apex.region( REG_SOL_NUEV_PLAZO ).refresh();
                }
            }
        }
    ); 
  }