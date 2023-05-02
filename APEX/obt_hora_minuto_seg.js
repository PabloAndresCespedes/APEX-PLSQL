/**
 * PabloACespedes 14.04.2023
 * @itemSeteo es el identificador de APEX del item a setear
 */
function obtHora({itemSeteo}){
    /*
     link referencia
     http://www.java2s.com/Code/JavaScript/Development/Getthecurrenttimeandthenextractthehoursminutesandseconds.htm
    */
    let date = new Date;
    let seconds = date.getSeconds();
    let minutes = date.getMinutes();
    let hours   = date.getHours();
    
    let timeString  = "" + ((hours < 10) ? "0" + hours : hours);
        timeString  += ((minutes < 10) ? ":0" : ":") + minutes;
        timeString  += ((seconds < 10) ? ":0" : ":") + seconds;

    apex.item( itemSeteo ).setValue( timeString );

}