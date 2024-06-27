prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.0'
,p_default_workspace_id=>4335884190047950
,p_default_application_id=>1000
,p_default_id_offset=>0
,p_default_owner=>'WMS'
);
end;
/
 
prompt APPLICATION 1000 - SIMUX WMS
--
-- Application Export:
--   Application:     1000
--   Name:            SIMUX WMS
--   Date and Time:   10:10 Friday June 21, 2024
--   Exported By:     ADMIN
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 76440223163085079
--   Manifest End
--   Version:         23.2.0
--   Instance ID:     2135623006102032
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/apex_items_with_buttons
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(76440223163085079)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'APEX.ITEMS.WITH.BUTTONS'
,p_display_name=>'APEX Items with APEX Button'
,p_category=>'STYLE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION F_RENDER (',
'    P_DYNAMIC_ACTION   IN APEX_PLUGIN.T_DYNAMIC_ACTION,',
'    P_PLUGIN           IN APEX_PLUGIN.T_PLUGIN',
') RETURN APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT AS',
'    VR_RESULT         APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT;',
'BEGIN',
'',
'    VR_RESULT.JAVASCRIPT_FUNCTION   := ''',
'    function () { ',
'        var btn = "#" + $(this)[0].action.affectedButtonId;',
'        var divCon = $("#'' || APEX_ESCAPE.HTML_ATTRIBUTE( P_DYNAMIC_ACTION.ATTRIBUTE_01 ) || ''").closest(".t-Form-itemWrapper");',
'        $(btn).appendTo(divCon);',
'        $(btn).addClass("a-Button a-Button--calendar"); ',
'    }'';',
'',
'    RETURN VR_RESULT;',
'END;'))
,p_api_version=>2
,p_render_function=>'F_RENDER'
,p_standard_attributes=>'BUTTON'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'This plug-in is used to move one or more APEX Button behind a Page Item. This is like the Plug-in "Textfield with Buttons" but you can use APEX Buttons, so you have full APEX Button and Theme Support. E.g. you got an Dialog Close Event when Close Dia'
||'log on Button Click.'
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/RonnyWeiss/APEX-Items-with-APEX-Buttons'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(76440511702090569)
,p_plugin_id=>wwv_flow_imp.id(76440223163085079)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Item where the button is added'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
