procedure consultar(in_columna_uno in number, in_columna_dos in number) as
  k_sep varchar2(1 char) := '^';
  l_q   varchar2(32767 char);
  l_b   wwv_flow_global.vc_arr2;
  l_v   wwv_flow_global.vc_arr2;
begin
  -- definir consulta sql
  l_q := q'[
              select *
              from tabla
              where columna_uno = :b_id
              and columna_dos = :b_2
              ]';
  
  -- definir parametros bind
  l_b := apex_util.string_to_table(p_string    => 'b_id' || k_sep || 'b_2',
                                   p_separator => k_sep);
  
  -- definir valores de los parametros
  l_v := apex_util.string_to_table(p_string    => in_columna_uno || k_sep ||
                                                  in_columna_dos,
                                   p_separator => k_sep);
  
  -- generar collections de APEX
  apex_collection.create_collection_from_query_b(p_collection_name    => 'COL_NAME_UK',
                                                 p_query              => l_q,
                                                 p_names              => l_b,
                                                 p_values             => l_v,
                                                 p_truncate_if_exists => 'YES');
end consultar;
