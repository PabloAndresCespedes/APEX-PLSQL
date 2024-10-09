/**
 * @PabloACespedes 
 * Se crea para aplicar el efecto de la libreria de tooltip
 */
const TIPPY_CLASS = 'tippyMsg';

apex.jQuery(window).on('theme42ready', function() {
    tippy(`.${TIPPY_CLASS}`, {
        content: (reference) => reference.getAttribute('title'),
        animation: 'fade',
        arrow: true
    });

    tippy('.a-IRR-button--search', {
        content: 'Click para buscar su información',
        animation: 'fade',
        arrow: true
    });

    apex.jQuery( "body" ).on("apexafterrefresh", function() {
        aplicarTippy({selector: `.${TIPPY_CLASS}`});
    });
    
});

function aplicarTippy({selector}){
    tippy(`${selector}`, {
        content: (reference) => reference.getAttribute('title'),
        animation: 'fade',
        arrow: true
    });
}

