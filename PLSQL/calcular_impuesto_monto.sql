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