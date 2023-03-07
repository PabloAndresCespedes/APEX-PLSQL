select *
  from fin_documento  as of TIMESTAMP to_timestamp('29/12/2022 13:30:00', 'DD/MM/YYYY HH24:MI:SS') 
  where doc_nro_doc = 10640000047;