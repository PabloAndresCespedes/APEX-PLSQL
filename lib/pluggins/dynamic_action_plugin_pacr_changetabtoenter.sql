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
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.5'
,p_default_workspace_id=>37029775289938291086
,p_default_application_id=>56477
,p_default_id_offset=>0
,p_default_owner=>'WKSP_SOFTWARESOLUTIONS'
);
end;
/
 
prompt APPLICATION 56477 - Taller APEX
--
-- Application Export:
--   Application:     56477
--   Name:            Taller APEX
--   Date and Time:   22:12 Friday November 8, 2024
--   Exported By:     SOFTWARESOLUTIONSCU@GMAIL.COM
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 12641620475123841942
--   Manifest End
--   Version:         24.1.5
--   Instance ID:     63113759365424
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/pacr_changetabtoenter
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(12641620475123841942)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'PACR.CHANGETABTOENTER'
,p_display_name=>'APEX Change TAB to ENTER'
,p_category=>'INIT'
,p_api_version=>2
,p_render_function=>'pacr_tab_to_enter_pck.f_render'
,p_standard_attributes=>'REGION:JQUERY_SELECTOR'
,p_substitute_attributes=>true
,p_version_scn=>1
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
