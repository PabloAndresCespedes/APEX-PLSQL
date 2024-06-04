/*
 @PabloACespedes 16.06.2023 07:47
 reemplazamos el texto de codigo de error 
*/
regexp_replace(sqlerrm, 'ORA-[0-9]+: ')

regexp_replace(in_msg, 'ORA-[0-9]+: ')