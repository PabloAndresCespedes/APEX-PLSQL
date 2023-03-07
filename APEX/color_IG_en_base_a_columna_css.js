/* En las propiedades/atributos de la COLUMNA de la Grilla se encuentra una sección de Advanced >> Javascript Initialization Code
pegamos el siguiente fragmento de JS
*/
function(config) {
    config.defaultGridColumnOptions = { 
      cellCssClassesColumn: 'CSS_SALARIO' // Aquí debes llamar el nombre de la columna que contiene tu clase CSS
    };   
     
    return config;
  }
  
  /*
    -- Reporte IG SQL:
    select 
      per_legajo,
      per_sal,
      case
        when per_salario <= 2500000 then
          'u-color-5' --> clase de APEX, ref. Univ. Theme
      else
        'u-color-35' --> clase de APEX, ref. Univ. Theme
      end css_salario
    from per_empl_salario;
    
  */
  