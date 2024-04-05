/**
 * Referencia de Philipp Hartenfeller y Paulo Augusto Künzel
 * Paulo: https://lct.software/blog/oracle-apex-context-menus
 * Philipp: https://www.linkedin.com/pulse/oracle-apex-context-menu-paulo-augusto-k%C3%BCnzel/
 * Todos los créditos son para ellos
 * Ejemplo para el uso de un menú contextual en Oracle APEX
 * Inicializar dentro de una accion dinamica load
 * La region a utilizar tiene que tener el ID regResultados
 * La columna que se usará para obtener el ID tiene que tener el header ID
 */

// creamos nuestro div vacío con un identificador
const cmIdHistorial = 'historial-ir-cm';

$('body').append(`<div id="${cmIdHistorial}"></div>`);

// reservamos el espacio para el menú contextual
const $menu = $(`#${cmIdHistorial}`);

// variable para guardar el ID del registro seleccionado
let clickedHistorial;

// creamos un array con los items del menú contextual y sus acciones
const menuItemsHistorial = [
  {
    type: 'action',
    label: 'Ver detalle',
    icon: 'fa-search',
    action: () => $s('P154_DET_CAB', `${clickedHistorial}`),
  },
  {
    type: 'action',
    label: 'Imprimir Resumen',
    icon: 'fa-print',
    action: () => $s('P154_IMPRIMIR_PEDIDO', `${clickedHistorial}`),
  },
];

// inicializamos el menú contextual
$menu.menu({
  iconType: 'fa',
  items: menuItemsHistorial,
});

// evento para mostrar el menú contextual al hacer click derecho
$(`#regResultados`).on('contextmenu', 'tr', (e) => {
  e.preventDefault();

  const clickTarget = e.currentTarget;
  // dentro de la region de resultados, buscamos el ID del registro seleccionado con este selector
  // significa si el header de la columna contiene la palabra ID
  clickedHistorial = $(clickTarget).find("td[headers^='ID']").text();
      
  $menu.menu('toggle', e.pageX, e.pageY);
});