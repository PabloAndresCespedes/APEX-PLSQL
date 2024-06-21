// Dentro de los atributos del item, ir a Advanced >> Custom Attributes y pegar el siguiente fragmento
onkeypress="return event.charCode >= 48 && event.charCode <= 57"

// para APEX se puede combinar con el evento que 
apex.jQuery(window).on('theme42ready', function() {
    $('.onlyNumber').on("keypress", event, function(){
        return event.charCode >= 48 && event.charCode <= 57;
    });
});