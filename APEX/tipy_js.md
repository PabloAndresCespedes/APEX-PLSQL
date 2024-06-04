# Utilizamos esta librería para agregar tooltips dentro de un informe interactivo
## Referencia librería: https://atomiks.github.io/tippyjs/
1. Importamos las librerías a nivel de app o workspace. Tambien se encuentra en ./lib/tipyJs
  - 1.1: tipyCss.css, tipyJs.js, tipyJsCore.js
  * #APP_IMAGES#tipyCss.css
  * #APP_IMAGES#tipyJs.js
  * #APP_IMAGES#tipyJsCore.js
2. Adjuntamos la URL dentro de la pagina.
3. Declaramos una clase para el elemento a resaltar, con la identificacion del tipo botón.
  - 3.1. En el ejemplo tenemos 2 botones, uno de detalle "btnDetalle" otro de cambio de estado "btnCambioEstado".
  - 3.2. Elemento para emular la acción de un botón con una icono de html:
       -  ```<span title="Detalle" onclick="$s('ITEM_A_SETEAR', #ID#)" class="margin-left-sm fa fa-list cursor btnDetalle" aria-hidden="true"></span>```
       -  ```<span title="Cambiar Estado" onclick="$s('ITEM_A_SETEAR', #ID#)" class="margin-left-sm fa fa-list cursor btnCambioEstado" aria-hidden="true"></span>```
4. Generar una acción dinámica After Refresh sobre la región donde se encuentren los tag html.
5. La acción dinámica tendrá una acción de tipo Execute JavaScript Code:
  - ```
        tippy('.btnDetalle', {
        content: 'Detalle',
        animation: 'fade',
        });

        tippy('.btnCambioEstado', {
        content: 'Cambiar Estado',
        animation: 'fade',
        });

        // Esto es para obtenera el valor del atributo title del span
        tippy('.btnCambioEstado', {
        content: (reference) => reference.getAttribute('title'),
        animation: 'fade',
        });

     ```
 6. Ya que necesitamos un refresh, se utiliza un método LazyLoad para la región, luego de cargar la página establecemos el refresh.
