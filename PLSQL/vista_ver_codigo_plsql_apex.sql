create or replace view codigo_plsq_apex_v as
/*
  Ejemplo de busqueda CLOB
  select * from codigo_plsq_apex_v a
  where  dbms_lob.instr(codigo,'FINI001.PP_A') > 0
  Ref. https://stackoverflow.com/questions/17649011/search-for-a-particular-string-in-oracle-clob-column
*/
select t.application_id      app_codigo
,      t.application_name    app_nombre
,      t.page_id             pagina
,      t.execution_sequence  secuencia
,      t.process_name        nombre
,      t.process_source      codigo
,      'PROCESO APEX'        tipo
from apex_200100.apex_application_page_proc t
where t.workspace='WS_ZEUS'
and   dbms_lob.getlength(t.process_source) > 0
union all
select da.application_id        app_codigo
,      da.application_name      app_nombre
,      da.page_id               pagina
,      da.action_sequence       secuencia
,      da.dynamic_action_name   nombre
,      to_clob(da.attribute_01) codigo
,      'ACCION DINAMICA'        tipo
from apex_200100.apex_application_page_da_acts da
where da.workspace='WS_ZEUS'
and   da.action_code='NATIVE_EXECUTE_PLSQL_CODE'