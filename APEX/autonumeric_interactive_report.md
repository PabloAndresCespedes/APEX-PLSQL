- Importar la librería para su utilizacion dentro de la página y/o aplicación
- Ref. /lib/autoNumeric.min.js
- Generar un elemento HTML para aplicar autonumeric
```
<input name="f01" value="#SEQ_ID#" style="display:none;">
<input class="u-tC u-bold col-12 resultado_#SEQ_ID# #CLASS_AUTONUMERIC#"
       data-cantidad-maxima="#STK_BODEGA_ORIGEN#"
       type="#TYPE_CANT_PEDIDO#" 
       name="#NAME_PEDIDO#" 
       value="#CANT_SESION#"
       data-id="#SEQ_ID#"
       onchange="updTotal()"
       >
```

- Tras un refresh en la región aplicar el siguiente JS
```
$('.u-autonum').each(function() {

    $(this).autoNumeric('init', {
        decimalPlacesOverride: 0,
        minimumValue: "0",
        maximumValue: `${$(this).data("cantidad-maxima")}`
    });
    
});
```
