-- Resultados de la query copiar y ejecutar
select 'alter ' || object_type || ' ' || object_name || ' compile;' x
from user_objects
where status <> 'VALID'
and object_type in ('VIEW','SYNONYM','PROCEDURE','FUNCTION','PACKAGE','TRIGGER');
