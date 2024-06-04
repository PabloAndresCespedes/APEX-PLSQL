/**
 * 29 05 2024
 * @PabloACespede C9
 * Opcion utilizada cuando se necesita hacer click en un objeto del DOM
 * y luego con eso ir y hacer focus sobre un TAB de la region DisplaySelector
 */
// La region debe tener un static ID
// En este ejemplo la region tiene un ID: regPedidos
// Por estandar de APEX le agrega _tab y luego el elemento es un <a></a> 
// con esto ejecutamos un click y listo
$( "#regPedidos_tab a" ).trigger( "click" )