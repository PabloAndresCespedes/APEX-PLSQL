// crear un aray con los nombres de los items
var iBloqueos = ['P174_FECHA_BLOQUEO', 'P174_MOTIVO_BLOQUEO'];

//utilizar la función APEX $x_disableItem
// primer argumento es el array de elementos, segundo elemento es el indicador si inhabilita o no
// cuando es TRUE: Deshabilita
// cunado es FALSE: Habilita

$x_disableItem(iBloqueos, true);
$x_disableItem(iBloqueos, false);
