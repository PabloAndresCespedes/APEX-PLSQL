apex.jQuery(function() {
  apex.theme42.util.configAPEXMsgs({
    autoDismiss: true,
    duration: 1200
  });
});

/**
 * @PabloACespedes
 * Utilizacion, en el INPUT_TEXT en el apartado de apariencia
 * al colocar la clase "onlyNumber" solo permitira la entrada de numeros dentro de él
 */
apex.jQuery(window).on('theme42ready', function() {
    $('.onlyNumber').on("keypress", event, function(){
        return event.charCode >= 48 && event.charCode <= 57;
    });
});