/*
---------------------------------------------------------------------
--
-- Copyright(C) 2024, @PabloACespedes - PY
-- All Rights Reserved
--
---------------------------------------------------------------------
-- Application : Developer tools
-- Source File name : obt_cambio_reg_tab.js
-- Purpose : Obtener registro de cambio sore regiones de tipo 
             "Region Display Selector" en APEX
--
-- Comments : Este ejemplo está implementado en la versión APEX 20.2
              Solo con una región general de este tipo
-- 
-- History :
-- 
-- MODIFIED (DD-Mon-YYYY) 
-- mipotter 26-Dec-2024 - Created
-- 
---------------------------------------------------------------------
*/
$('.apex-rds').data('onRegionChange', function(mode, activeTab) {
    let l_pestanha_activada = activeTab.href; // obtiene el nombre de STATIC_ID
    console.log( l_pestanha_activada );
});