PL/SQL Developer Test script 3.0
34
-- Created on 07/02/2025 by @PabloACespedes 
declare 

begin
  pkg_cronometro.pp_inicializar(in_rlog_oper => 'ADCS', in_rlog_proceso => 'TEST_PABLOC');
  
  <<bloq_uno>>
  begin
    pkg_cronometro.pp_iniciar_bloque(in_rlog_desc => 'bloque 01');
      dbms_lock.sleep(seconds => 3);
    pkg_cronometro.pp_finalizar_bloques ;
    pkg_cronometro.pp_agregar_log       ;
  end bloq_uno;
  
  <<bloq_dos>>
  begin
    pkg_cronometro.pp_iniciar_bloque(in_rlog_desc => 'bloque 02');
      dbms_lock.sleep(seconds => 1.55);
    pkg_cronometro.pp_finalizar_bloques ;
    pkg_cronometro.pp_agregar_log       ;
  end bloq_dos;
  
  <<bloq_tres>>
  begin
    pkg_cronometro.pp_iniciar_bloque(in_rlog_desc => 'bloque 03');
      dbms_lock.sleep(seconds => .1);
    pkg_cronometro.pp_finalizar_bloques ;
    pkg_cronometro.pp_agregar_log       ;
  end bloq_tres;
  
  pkg_cronometro.pp_grabar_logs;
  
  commit;
end;
0
0
