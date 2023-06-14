/**
* @PabloACespedes 13.06.2023
  opcion para split de datos concatenados por dos puntos ":"
*/
-- Opcion 1
SELECT REGEXP_SUBSTR('1:2:3', '[^:]+', 1, LEVEL) AS IND
FROM DUAL
CONNECT BY REGEXP_SUBSTR('1:2:3', '[^:]+', 1, LEVEL) IS NOT NULL

-- Opcion 2
 select column_value x from table( apex_string.split_numbers(
      p_str => '1:2:3'
    , p_sep => ':'
 ))