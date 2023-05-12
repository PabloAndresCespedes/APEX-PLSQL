procedure discriminar_impuesto(
    /*
      en Paraguay para el IVA es util, recordar generar el calculo ya agrupado para no tener 
      inconvenientes con el redondeo de la moneda local PYG
    */
    in_precio_con_impuesto  in  number
  , in_porc_base_imponible  in  number
  , in_porc_impuesto        in  number
  , in_redondeo             in  number
  , out_monto_sin_impuesto  out number
  , out_monto_impuesto      out number
  )as
  begin
    <<c_impuesto>>
    case
      when in_porc_impuesto = 0 then
        out_monto_sin_impuesto := round( in_precio_con_impuesto, in_redondeo );
        out_monto_impuesto     := round( 0, in_redondeo );
      else
        out_monto_sin_impuesto :=
        round(
        in_precio_con_impuesto
        /
        ( 1 + (( in_porc_base_imponible / 100 ) * ( in_porc_impuesto / 100 )))
        , in_redondeo
        );
        
        out_monto_impuesto := (in_precio_con_impuesto - out_monto_sin_impuesto);
    end case c_impuesto;
  end discriminar_impuesto;

  /**
  * test para PLSQL
  */
  ---
  declare
  -- obt el 10% iva de 100.000 gs
  k_precio_con_impuesto number := 100000;
  k_porc_base_imponible number := 100;
  k_porc_impuesto       number := 10;
  k_redondeo            number := 0;
  
  l_monto_sin_impuesto number;
  l_monto_impuesto number;
begin
  <<c_impuesto>>
  case
    when k_porc_impuesto = 0 then
      l_monto_sin_impuesto := round( k_precio_con_impuesto, k_redondeo );
      l_monto_impuesto     := round( 0, k_redondeo );
    else
      l_monto_sin_impuesto :=
      round(
      k_precio_con_impuesto
      /
      ( 1 + (( k_porc_base_imponible / 100 ) * ( k_porc_impuesto / 100 )))
      , k_redondeo
      );
        
      l_monto_impuesto := (k_precio_con_impuesto - l_monto_sin_impuesto);
      
      dbms_output.put_line(a => 'l_monto_sin_impuesto: '||l_monto_sin_impuesto);
      dbms_output.put_line(a => 'l_monto_impuesto: '||l_monto_impuesto);
  end case c_impuesto;
end;
----------------- fin de test para PLSQL ----------------