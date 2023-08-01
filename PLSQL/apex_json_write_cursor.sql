DECLARE
  c_empresa sys_refcursor;
begin
  
  apex_json.initialize_clob_output;
  
  open c_empresa for select x.empr_codigo
                          , x.empr_razon_social
                          , x.empr_ruc 
                          ,cursor(
                            select 
                              e.empl_legajo
                            , e.empl_doc_ident  ci
                            from per_empleado e
                            where e.empl_empresa = x.empr_codigo
                            and   e.empl_situacion= 'A'
                            and rownum <= 5
                          ) datos
                          from gen_empresa x
                          where x.empr_codigo in (1,2);
  apex_json.open_object;                        
    apex_json.write( 'empleado_empresa', c_empresa );
  apex_json.close_object;
                      
  dbms_output.put_line( apex_json.get_clob_output );

  apex_json.free_output;

end;