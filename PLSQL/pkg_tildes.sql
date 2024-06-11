create or replace package pkg_tildes is
  -- Author  : @PabloACespedes
  -- Created : 07/06/2024 7:24:53
  -- Purpose : manejar acentuaciones de base de datos al APEX
  --           Compilar desde un cliente PLSQL que no altere nuevamente los caracteres especiales
  --           Esto se compiló desde el APEX [SQL Workshop >> Object Browser >> Packages]

  -- Sufix: 
  --        _min son letras en minusculas
  --        _may son letras en mayusculas 

  subtype letra_type is varchar2(1 char);

  k_a_min    constant letra_type := 'á';
  k_e_min    constant letra_type := 'é';
  k_i_min    constant letra_type := 'í';
  k_o_min    constant letra_type := 'ó';
  k_u_min    constant letra_type := 'ú';
  k_enhe_min constant letra_type := 'ñ';

  k_a_may    constant letra_type := 'Á';
  k_e_may    constant letra_type := 'É';
  k_i_may    constant letra_type := 'Í';
  k_o_may    constant letra_type := 'Ó';
  k_u_may    constant letra_type := 'Ú';
  k_enhe_may constant letra_type := 'Ñ';
  
  function a_min    return letra_type;
  function e_min    return letra_type;
  function i_min    return letra_type;
  function o_min    return letra_type;
  function u_min    return letra_type;
  function enhe_min return letra_type;

  function a_may    return letra_type;
  function e_may    return letra_type;
  function i_may    return letra_type;
  function o_may    return letra_type;
  function u_may    return letra_type;
  function enhe_may return letra_type;
  
end pkg_tildes;
/
create or replace package body pkg_tildes is
  
function a_min    return letra_type is begin return k_a_min;    end a_min;
function e_min    return letra_type is begin return k_e_min;    end e_min;
function i_min    return letra_type is begin return k_i_min;    end i_min;
function o_min    return letra_type is begin return k_o_min;    end o_min;
function u_min    return letra_type is begin return k_u_min;    end u_min;
function enhe_min return letra_type is begin return k_enhe_min; end enhe_min;

function a_may    return letra_type is begin return k_a_may;    end a_may;
function e_may    return letra_type is begin return k_e_may;    end e_may;
function i_may    return letra_type is begin return k_i_may;    end i_may;
function o_may    return letra_type is begin return k_o_may;    end o_may;
function u_may    return letra_type is begin return k_u_may;    end u_may;
function enhe_may return letra_type is begin return k_enhe_may; end enhe_may;

end pkg_tildes;
/