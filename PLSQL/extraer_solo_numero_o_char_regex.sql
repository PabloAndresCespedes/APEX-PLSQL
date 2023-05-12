/*
* @PabloACespedes 02/05/2023 09:34
* Dentro del string enviamos la mezclade caracteres, lo que permite el regex es sacar de forma ordenada solo los numericos
* Referencia: https://stackoverflow.com/questions/32861256/extract-number-from-string-with-oracle-function
*/
select regexp_replace('stack12345overflow569', '[[:alpha:]]|_') as numbers from dual;

/*
* Otras opciones para extraer data
*/
select regexp_replace('stack12345overflow569', '[^0-9]', '') as numbers,
       regexp_replace('Stack12345OverFlow569', '[^a-z and ^A-Z]', '') as characters
from dual