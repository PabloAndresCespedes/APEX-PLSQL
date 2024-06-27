Importar libreria: `#APP_FILES#onscan.js`

Inicializar codigo barra según colector:
```
    onScan.attachTo(document, 
        {
            "scanButtonKeyCode":false,
            "scanButtonLongPressTime":500,
            "timeBeforeScanTest":100,
            "avgTimeByChar":30,
            "minLength":6,
            "suffixKeyCodes":[9,10,13],
            "prefixKeyCodes":[],
            "ignoreIfFocusOn":false,
            "stopPropagation":false,
            "preventDefault":false,
            "reactToKeydown":true,
            "reactToPaste":true,
            "singleScanQty":1,
            "reactToKeyDown":true,
            onScan: function(sCode, iQty) {
                agregarEtiqueta({codigoBarra: sCode});
            }
        },
    );
```
Ejemplo uso enviando por ajax en APEX:
```
var popup;

function mostrarPopup(){
    popup = apex.widget.waitPopup();
}

function removerPopup(){
    popup.remove();
}

function agregarEtiqueta({codigoBarra}){
    mostrarPopup();

    let ajaxAgregar = apex.server.process("AGREGAR_ETIQUETA", {
        pageItems: ['P_EMPRESA', 'P_CLIENTE_TITULAR', 'P4_CARGA_ID'],
        x01: codigoBarra
    });

    ajaxAgregar.done(function(response){
        if(response.ind_error == '0'){
            apex.message.showPageSuccess('Etiqueta agregada!');
            apex.region('regDetalle').refresh();
        }else{
            apex.message.alert(response.msg_error);
        }
    }).always(function(){
        removerPopup();
    });
    
}
```
