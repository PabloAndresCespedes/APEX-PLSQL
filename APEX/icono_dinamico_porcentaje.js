/*
* PabloACespedes 26/04/2024
* Generar iconos dinamicos en iteractive report
*/
/* Language: html
   Dentro de la grilla de iteractive report
   colocar en los atributos HTML de la columna
   el siguiente codigo <i id="PORC_EXISTENCIA_ICON_#SEQ_ID#" class="#CSS_ICON#">
*/

/* Language: javascript
   Para los atributos de la pagina en la parte de Javascript
   colocar lo siguiente
*/

function cambiaPorcentajeHTML({seq, porc, icon}){
    $('#PORC_EXISTENCIA_'+ seq ).html( porc ); // selector de la columna
    $('#PORC_EXISTENCIA_ICON_'+ seq ).removeClass().addClass( icon ); // remover la ultima clase y agregar la nueva
}

// dentro de estre proceso ajax retorna la secuencia porcentaje y el icono
// nos ayudamos de map para recorrer el array y enviar a cambiaPorcentajeHTML()
function calcularPorcDisponibilidad(){
    let ajaxPorcentaje = apex.server.process('obtPorcentajeDisponible', { pageItems: ['P_EMPRESA'] });
    ajaxPorcentaje.done((pData) => {
       pData.map((dato) => {cambiaPorcentajeHTML({seq: dato.seq, porc: dato.porcentaje, icon: dato.icon})});
    });
}

// proceso backend plsql
// la idea es que en porcentaje sea del 0 al 100
// y la secuencia sea un identificador unico de la fila
procedure agrega_json(
    in_seq  in varchar2
  , in_porc in varchar2
  )as
    l_icon      varchar2( 30 char );
    l_porc_icon number;
  begin
    l_porc_icon := floor(coalesce(in_porc, 0)/100 * 20) / 20*100;

    l_icon := case when in_porc is null then 'fa fa-exclamation' else 'fa fa-pie-chart-'||l_porc_icon end;

    apex_json.open_object;
      apex_json.write( 'seq'        , in_seq);
      apex_json.write( 'porcentaje' , ' '||in_porc || '%');
      apex_json.write( 'icon'       , l_icon);
    apex_json.close_object;

    apex_collection.update_member_attribute(
       p_collection_name => k_list_pedidos
    ,  p_seq             => in_seq
    ,  p_attr_number     => 20 -- reservado para porc_existencia
    ,  p_attr_value      => in_porc ||'%'
    );

    apex_collection.update_member_attribute(
       p_collection_name => k_list_pedidos
    ,  p_seq             => in_seq
    ,  p_attr_number     => 21 -- reservado css icono
    ,  p_attr_value      => l_icon
    );
  exception
    when others then
      Raise_application_error(-20000, 'agrega_json interno '|| sqlerrm );
  end agrega_json;