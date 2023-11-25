/*
 @PabloACespedes 15.03.2023 08:47 am
 Funcion recomendada utilizar en el backend de forma empaquetada, por compilación
*/
  -- 1. en la base de datos
  function fl_auto_fecha(
    i_fecha in varchar2
  ) return varchar2
  deterministic
  is
    /*
      author  : @PabloACespedes \(^-^)/
      modified : 20/01/2023 13:06:44
      code refactor
    */
    v_fecha        varchar2(10);
    v_fecha_aux    varchar2(100);
    v_fecha_actual varchar2(10);
  begin
    if regexp_replace(i_fecha, '[^0-9]') is null then
      v_fecha := to_char(sysdate, 'DD/MM/YYYY');
      return v_fecha;
    end if;

    v_fecha_aux := regexp_replace(i_fecha, '[^0-9]');

    if length(v_fecha_aux) = 1 then
      v_fecha_aux := '0' || v_fecha_aux;
    end if;
    
    v_fecha_actual := to_char(sysdate, 'DDMMYYYY');
    
    v_fecha := v_fecha_aux || substr(v_fecha_actual, length(v_fecha_aux) + 1, 10);

    if to_number(substr(v_fecha, 3, 2)) > 12 then
      raise_application_error(-20000, 'El mes se ingresa desde el 1 hasta el 12!');
    end if;

    v_fecha := to_date(v_fecha, 'DD/MM/YYYY');

    return v_fecha;

  end fl_auto_fecha;

  -- 2. llamada en APEX CallBack process
  -- esto se puede declarar a nivel de pagina o aplicación
  -- A nivel de aplicación sería: Ajax Callback: Run this application process when requested by a page process.
  -- A nivel de pagina: Processing >> Ajax Callback
    declare
        l_fecha  varchar2(255 char);
    begin
        l_fecha := apex_application.g_x01;

        -- aqui llamamos la funcion de autofecha de arriba, ya se encuentra en un pck llamado GENERAL
        l_fecha := general.fl_auto_fecha( i_fecha => l_fecha );

        apex_json.open_object;
            apex_json.write(p_name => 'ind_error', p_value => 0);
            apex_json.write(p_name => 'l_fecha', p_value => l_fecha);
        apex_json.close_object;
    exception
        when others then
            apex_json.open_object;
                apex_json.write(p_name => 'ind_error', p_value=> 1);
                apex_json.write(p_name => 'mensaje', p_value=> regexp_replace(sqlerrm, 'ORA-[0-9]+: '));
            apex_json.close_object;
    end;