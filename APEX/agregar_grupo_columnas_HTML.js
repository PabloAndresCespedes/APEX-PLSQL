/**
 * colspan se ajusta en base a un grupo de columnas que no tendrá cambios en su ancho 
 * es decir, no se agrega o remueven columnas
 */
function templateHeader(){
    const templ = `<tr>
                        <th class="t-Report-colHead" align="center" colspan="3">Finanzas</th>
                        <th class="t-Report-colHead" align="center" colspan="3">Al Registrar</th>
                        <th class="t-Report-colHead" align="center" colspan="2">Pagos</th>
                    </tr>`;
    
    return templ;
}

/* 
  Verificar el elemento afectado, utilizamos el elemento afectado ya que podemos reutilizar si amerita
  CONFIGURACION: Affected Elements: 
     * Selection Type: jQuery Selector
     * jQuery Selector: #report_table_regDetSolLista > thead
*/

$(this.affectedElements).html(function(index,currentcontent){
    return templateHeader() + currentcontent;
});

// short sentence
$(this.affectedElements).html((index,currentcontent) => templateHeader() + currentcontent);


/// VERSION 2
const REG_DET_SOL_LISTA = 'staticIdRegion';

function templateHeader(){
    const templ = `<tr>
                        <th class="t-Report-colHead" align="center" colspan="4">Finanzas<br><small>Registro(s) actualmente en finanzas ya incluyendo redefiniciones.</small></th>
                        <th class="t-Report-colHead" align="center" colspan="2">Al Registrar<br><small>Registro(s) al realizarse la solicitud.</small></th>
                        <th class="t-Report-colHead" align="center" colspan="1">Pagos<br><small>Pagos de la cuota.</small></th>
                        <th class="t-Report-colHead" align="center" colspan="1">Saldos<br><small>Diferencia a pagar de la cuota en finanzas.</small></th>
                    </tr>`;

    return templ;
}
/***********************************************************/
apex.jQuery( '#' + REG_DET_SOL_LISTA ).on( "apexafterrefresh", function() {
    $('#report_table_' + REG_DET_SOL_LISTA + ' > thead').html((index,currentcontent) => templateHeader() + currentcontent);
});