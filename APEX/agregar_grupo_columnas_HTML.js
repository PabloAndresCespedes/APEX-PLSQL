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