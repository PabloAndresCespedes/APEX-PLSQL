select 
      -- 10/03/2023 12:33 @PabloACespedes
      -- tener en cuenta que l_nro_documento debe ser hasta 13 digitos maximos, y como minimo 10 digitos
      -- 001 001 0000001
      lpad( substr( l_nro_documento , 0, length(l_nro_documento)-10 ), 3, 0 )
      || '-' ||
      substr(l_nro_documento, -10, 3)
      || '-' ||
      substr(l_nro_documento, -7, 7)
    x  
from dual;