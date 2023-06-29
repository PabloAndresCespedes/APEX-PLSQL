with
  -- validar ruc
  function pacrRucVal(ruc in varchar) return number is
  begin
    case
      when fl_ruc_valido(p_numero => ruc) then
        return 1;
    else
      return 0;
    end case;
  end;
  -- limpiar caracteres
  function clear_item(item varchar2) return varchar2 is
  begin
    return replace(replace(item, '.', ''), ' ', '');
  end;
select /*+ INDEX(FIN_CLIENTE XAK_CLI_EST) */
       cli_codigo                    codigo
,      cli_nom                       descripcion
,      clear_item(item => cli.cli_ruc_dv)||'-'||cli_dv ruc_actual
,      clear_item(item => cli.cli_ruc_dv)||'-'||
       case
           when pacrRucVal(ruc => clear_item(item => cli.cli_ruc_dv)||'-'|| 0 ) = 1 then 0
           when pacrRucVal(ruc => clear_item(item => cli.cli_ruc_dv)||'-'|| 1 ) = 1 then 1
           when pacrRucVal(ruc => clear_item(item => cli.cli_ruc_dv)||'-'|| 2 ) = 1 then 2
           when pacrRucVal(ruc => clear_item(item => cli.cli_ruc_dv)||'-'|| 3 ) = 1 then 3
           when pacrRucVal(ruc => clear_item(item => cli.cli_ruc_dv)||'-'|| 4 ) = 1 then 4
           when pacrRucVal(ruc => clear_item(item => cli.cli_ruc_dv)||'-'|| 5 ) = 1 then 5
           when pacrRucVal(ruc => clear_item(item => cli.cli_ruc_dv)||'-'|| 6 ) = 1 then 6  
           when pacrRucVal(ruc => clear_item(item => cli.cli_ruc_dv)||'-'|| 7 ) = 1 then 7
           when pacrRucVal(ruc => clear_item(item => cli.cli_ruc_dv)||'-'|| 8 ) = 1 then 8  
           when pacrRucVal(ruc => clear_item(item => cli.cli_ruc_dv)||'-'|| 9 ) = 1 then 9
       end ruc_correcto
from fin_cliente cli
where cli.cli_est_cli='A'
and   cli_empr = 1
and   clear_item(item => cli.cli_ruc_dv) is not null
and   pacrRucVal(ruc => clear_item(item => cli.cli_ruc_dv)||'-'||cli_dv) = 0
and   cli.cli_tipo_contribuyente=2