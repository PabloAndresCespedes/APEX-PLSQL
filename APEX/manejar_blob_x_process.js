function getPDFReport({idDocClave, esRemision}){
/*
    @PabloACespedes 21/12/2022 11:42
    en la variable l_url obtenemos el pdf de nuestra tabla
    con un proceso de BBDD Revisar proceso
    Backend/obt_archivo_blob_web.sql

    En la URL el argumento:
    - GET_REPORT hace referencia al proceso APEX
    - DOC_CLAVE_REPORT hace referencia al item global de aplicación de APEX
    - ES_REMISION_MANUAL: debe ser 0 o 1 (0 es FALSE, 1 es TRUE en la BBDD), para indicar si es un reporte de impresion de Remision Manual
*/
const l_url = `f?p=&APP_ID.:0:&APP_SESSION.:APPLICATION_PROCESS=GET_REPORT:::DOC_CLAVE_REPORT,ES_REMISION_MANUAL:${idDocClave},${esRemision}`;
     
    // generamos un spines en la pagina
    var lSpinner$ = apex.util.showSpinner( $( "body" ) );
     
    /* hacemos una petición y convertimos a un archivo compatible a blob
       tener en cuenta que sabemos que será un blob y no otro tipo
    */
    fetch(l_url)
     .then(r => r.blob())
     .then(pdf => {
         // eliminamos el spinner
         lSpinner$.remove();

         // abrimos una pestaña nueva del navegador con el reporte renderizado
         apex.navigation.openInNewWindow( URL.createObjectURL(pdf), "pdfReporte" );
     })
 }