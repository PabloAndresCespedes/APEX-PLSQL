/*
 * @PabloACespedes 03/05/2023 16:50 
 * datos y ejemplo de como obt. informacion de sesion de la pagina en APEX en un contexto de Javascript
 */

$v('pFlowId') // APP_ID
$v('pFlowStepId') // APP_PAGE_ID
$v('pInstance') // SESSION

// ejemplo de url para descargar un IR
let href="f?p=" + $v( "pFlowId" ) +":"+$v('pFlowStepId')+":"+$v('pInstance')+":CSV::::";
apex.navigation.redirect( href );