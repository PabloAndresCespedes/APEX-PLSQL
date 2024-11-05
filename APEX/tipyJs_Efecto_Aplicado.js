/**
 * Author: @PabloACespedes 
 * DTHR: 22/10/2024 10:45
 * Purpose: aplicar el efecto de la libreria de tooltip
 * Para su utilización dentro de un elemento HTML debe 
 * 1- Definir el atributo TITLE
 * 2- Definir la clase "tippyMsg" de la constante TIPPY_CLASS
 * Ejemplo:
 *   <span class="fa fa-check-circle tippyMsg" title="Sincronizado correctamente"></span>
 */
const TIPPY_CLASS = '.tippyMsg';

function aplicarTippy({selector}){
    tippy(selector, {
        content: (reference) => reference.getAttribute('title'),
        animation: 'fade',
        arrow: true
    });
}

apex.jQuery( window ).on('theme42ready apexafterrefresh', function() {
    aplicarTippy({selector: TIPPY_CLASS});
});