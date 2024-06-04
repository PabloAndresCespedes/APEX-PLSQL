> @PabloACespedes C9. 03/06/2024 20:28

> Documentacion de utilizacion en APEX

> Referencias

> Emulate TAB: https://github.com/e-hein/emulate-tab/tree/master

> Key Code: https://www.toptal.com/developers/keycode

### Importar el archivo de /lib/emulate-tab.min.js

- El siguiente fragmento de código aumenta y decrementa cantidades de items dentro de Interactive Report
```
$(`#${COMPONENTE.R_RESULTADOS}`).on("keydown", ".u-autonum", function(e) { 
    // referencias en:
    // Codigo de teclas: https://www.toptal.com/developers/keycode
    // Librería TAB: https://github.com/e-hein/emulate-tab/tree/master
    if (e.key === "Enter" || e.key === "ArrowDown") {
       e.preventDefault();
       emulateTab();
    }else if (e.key === "ArrowUp") {
       e.preventDefault();
       emulateTab.backwards();
    }else if (e.key === "+") {
       e.preventDefault();
       
       let l_new;

        if( $(this).val() !== ''){
            l_new = parseInt($(this).val()) + 1;
            if (parseInt($(this).data("cantidad-maxima")) < l_new){
                l_new = l_new - 1;
            }
        }else{
            l_new = 0;
        }

        $(this).val(l_new);

    }else if (e.key === "-") {
       e.preventDefault();

       let l_new;

        if( $(this).val() !== '' && parseInt($(this).val()) - 1 >= 0){
            l_new = parseInt($(this).val()) - 1;
        }else{
            l_new = 0;
        }

        $(this).val(l_new);
    }
});
```
- El elemento dentro de la región la siguiente expresión HTML para su formateo
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
