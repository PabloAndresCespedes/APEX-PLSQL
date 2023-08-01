/**
  12.07.2023 11:02
  Ref. https://oradbdev.mathiasmagnusson.com/2023/04/06/using-package-variables-in-sql/
*/
WITH FUNCTION get_const RETURN NUMBER IS
    BEGIN
    RETURN pkg.some_constant;
    END;
SELECT get_const ...