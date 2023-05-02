  function obt_total_dias_habiles(
    /*
    * Obtenemos el ult. dia habil para obtener la fecha de plazo
    * retonamos la fecha habil
    */
    in_fecha_inicio in date
  , in_plazo_pago   in number
  , in_empresa      in number
  ) return date is
    l_fecha_flag date;    
    l_total_primer_add number;
  begin
    -- buscamos todos los feriados y domingos del rango ingresado
    select sum( dias ) x
    into l_total_primer_add
    from (
      select count(1) dias -- dias_feriados
      from gen_feriado f
      where f.fer_empr = in_empresa
      and   f.fer_fec between in_fecha_inicio and ( in_fecha_inicio + in_plazo_pago)
      and   to_char( f.fer_fec, 'D' ) <> 7 -- 7: dia domingo NO
      union all
      select sum( dia ) dias -- dias_domingos
      from(
        select case
                when to_char( in_fecha_inicio + level , 'D' ) = 7 then
                  1
                else
                  0
                end dia
        from dual
        connect by ( in_fecha_inicio - 1 ) + level <= ( (in_fecha_inicio - 1) + in_plazo_pago )
      )
    );

    -- iniciamos la fecha flag, que es la fecha fin dada del primer calculo
    -- esto es por si esa fecha fin de resultado es de vuelta feriado o domingo
    l_fecha_flag := ( in_fecha_inicio + l_total_primer_add + in_plazo_pago );
    
    <<w_ult_verif>>
    while ( to_char( l_fecha_flag, 'D' ) = 7 -- 7 es Domingo, verificar siempre el idioma de la base de datos
           or 
           is_no_business(in_date => l_fecha_flag, in_empresa => in_empresa )
          )
    loop
      l_fecha_flag := ( l_fecha_flag + 1 );
    end loop w_ult_verif;
    
    return l_fecha_flag;
    
  end obt_total_dias_habiles;