DECLARE
  l_flow_id NUMBER (20);
  l_region_id NUMBER (20);
  l_query VARCHAR2 (4000);
  l_result VARCHAR2 (4000);

BEGIN
  wwv_flow_api.set_security_group_id(apex_util.find_security_group_id('WS_ZEUS'));

  SELECT application_id, region_id, sql_query
    INTO l_flow_id, l_region_id, l_query
    FROM apex_application_page_ir
   WHERE page_id = 1558 AND application_id = 102
     AND region_name = 'STKL2766';

  APEX_200100.wwv_flow_worksheet_standard.synch_report_columns (p_flow_id => l_flow_id,
                                                                p_region_id => l_region_id,
                                                                p_query => l_query,
                                                                p_add_new_cols_to_default_rpt => 'Y');
---COMMIT;
END;