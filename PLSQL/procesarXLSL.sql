declare
-- generamos un tipo para la estructura de registros a guardar
type r_concepto is record(
    empresa_local     varchar2( 255 char )
,   empresa_externa   varchar2( 255 char )
,   concepto_local    varchar2( 255 char )
,   concepto_externo  varchar2( 255 char )
);

-- creamos otro tipo tabla para alojar datos con un indel pls_integer
type t_conceptos is table or r_concepto index by pls_integer;

-- declaramos la variable que se utilizara para volcar los datos
l_all_conceptos t_conceptos;

begin
    -- get data xlsl
    select in_empresa_loc    empresa_local
    ,      in_empresa_ext    empresa_externa
    ,      p.col001          concepto_local 
    ,      p.col002          concepto_externo              
     bulk collect into l_all_conceptos      
     from apex_application_temp_files f, 
         table( apex_data_parser.parse(
                  p_content   => f.blob_content,
                  p_file_name => f.filename
                  )
              ) p
     where f.name = in_file_name;
     
     <<f_recorrer_datos>>
     for i in 1 .. l_all_conceptos.count loop
       /**
       * Validamos que exista la empresa externa registrada en la base de datos actual
       * en el caso que si, insertamos el registro
       */
       <<validar_empresa_externa>>
       declare 
        l_dummy pls_integer;
       begin
         select distinct 1 into l_dummy
         from gen_empresa e
         where e.empr_codigo = l_all_conceptos(i).empresa_externa;

         insert into fin_conceptos_externos(empresa_id
                                  ,concepto_local
                                  ,concepto_externo
                                  ,empresa_externa_id
                                  )
         values(
            l_all_conceptos(i).empresa_local
        ,   l_all_conceptos(i).empresa_externa
        ,   l_all_conceptos(i).concepto_local
        ,   l_all_conceptos(i).concepto_externo
         );
       exception
         when no_data_found then
           null;
       end validar_empresa_externa;

     end loop f_recorrer_datos;
end;