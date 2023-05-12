create or replace trigger log_deshabilita_trg before alter on database
  when (sys.sysevent = 'ALTER' and sys.dictionary_obj_type = 'TRIGGER')
declare
-- 10/05/2023 13:56:18 @PabloACespedes Paraguay-Campo9
-- disparador de base de datos informando deshabilitacion de triggers
l_comando varchar2(4000);
sql_text  ora_name_list_t;
l_accion  varchar2(15 char);
l_error   varchar2(32767);
begin
  <<f_sqls>>
  for i in 1..ora_sql_txt(sql_text) loop
     l_comando := l_comando ||sql_text(i);
  end loop f_sqls;
  
  <<c_accion>>
  case
    when lower(l_comando) like '%disable%' then
      l_accion := 'DISABLE';
    when lower(l_comando) like '%enable%' then
      l_accion := 'ENABLE';
    else
      l_accion := 'UNKNOWN';
  end case c_accion;
  
  insert into log_disparadores_estado(
     inicio_alter
  ,  fin_alter
  ,  usuario
  ,  ip_maquina
  ,  objeto
  ,  accion
  ,  comando
  )values(
     sysdate
  ,  null -- esto se_llena cuando se_marca como leida la notificacion
  ,  ora_login_user
  ,  ora_client_ip_address
  ,  ora_dict_obj_name
  ,  l_accion
  ,  l_comando
  );
exception
  when others then
    l_error := sqlerrm;
    
    insert into GEN_LOGIN_NO_VALIDO(ip_desc)
    values('fallo al auditar deshabilitacion de triggers: '||l_error);
end;
