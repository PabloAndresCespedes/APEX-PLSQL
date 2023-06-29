create or replace package XGN is

   PROCEDURE TEXT_SELECT1 (I_TABLA IN VARCHAR2) ; 

   PROCEDURE TEXT_SELECT2 (I_TABLA IN VARCHAR2) ; 

   PROCEDURE TEXT_SELECT_COLL (I_TABLA IN VARCHAR2) ; 
   
   PROCEDURE TEXT_ADD_MEMBER_COLL (I_TABLA IN VARCHAR2) ; 
   
   PROCEDURE TEXT_REC_TYPE (I_TABLA IN VARCHAR2) ; 

   PROCEDURE TEXT_ASIG_VAL(I_TABLA IN VARCHAR2, I_PREF_O IN VARCHAR2 DEFAULT NULL, I_PREF_D IN VARCHAR2 DEFAULT NULL ) ; 
            
end XGN;
/
create or replace package body XGN is
   --===============================================================================================
   PROCEDURE TEXT_SELECT1 (I_TABLA IN VARCHAR2) IS 
       CURSOR CUR_DATOS IS 
        
        SELECT CASE 
               WHEN ROWNUM = 1 THEN 
                  RPAD('SELECT ', 07, ' ')                   
               ELSE 
                  RPAD(' ', 07, ' ')             
               END                                               || 
               RPAD('V.' || TC.COLUMN_NAME, 40, ' ')             || 
               RPAD(TC.COLUMN_NAME, 30, ' ')  ||  ','            
               /*
               || 
               RPAD(' ', 10 , ' ')  ||  '--'                     || 
               'CO.C'                                            || 
               LTRIM(TO_CHAR(1+ROWNUM, '000'))                   
               */                                                  
                                                                 FILA  
          FROM ( SELECT TC.* 
                   FROM USER_TAB_COLS TC 
                  WHERE TC.TABLE_NAME = I_TABLA 
                  ORDER BY TC.COLUMN_ID 
               ) TC 
         WHERE TC.TABLE_NAME = I_TABLA 
        UNION ALL  
        SELECT '  FROM ' || I_TABLA || ' V'  FILA FROM DUAL 
       ;  
         
   BEGIN
       FOR R IN CUR_DATOS LOOP 
           DBMS_OUTPUT.put_line(R.FILA);
       END LOOP; 
   END;
   --===============================================================================================       
   PROCEDURE TEXT_SELECT2 (I_TABLA IN VARCHAR2) IS 
       CURSOR CUR_DATOS IS 
        
        SELECT CASE 
               WHEN ROWNUM = 1 THEN 
                  RPAD('SELECT ', 07, ' ')                   
               ELSE 
                  RPAD(' ', 07, ' ')             
               END                                               || 
               RPAD('V.' || TC.COLUMN_NAME, 40, ' ')             || 
               RPAD(TC.COLUMN_NAME, 30, ' ')  ||  ','            
               --/*
               || 
               RPAD(' ', 10 , ' ')  ||  '--'                     || 
               'CO.C'                                            || 
               LTRIM(TO_CHAR(1+ROWNUM, '000'))                   
               --*/                                                  
                                                                 FILA  
          FROM ( SELECT TC.* 
                   FROM USER_TAB_COLS TC 
                  WHERE TC.TABLE_NAME = I_TABLA 
                  ORDER BY TC.COLUMN_ID 
               ) TC 
         WHERE TC.TABLE_NAME = I_TABLA 
        UNION ALL  
        SELECT '  FROM ' || I_TABLA || ' V'  FILA FROM DUAL 
       ;  
         
   BEGIN
       FOR R IN CUR_DATOS LOOP 
           DBMS_OUTPUT.put_line(R.FILA);
       END LOOP; 
   END;
   --===============================================================================================  
   PROCEDURE TEXT_SELECT_COLL (I_TABLA IN VARCHAR2) IS 
      CURSOR CUR_DATOS IS 
      SELECT RPAD('SELECT ', 07, ' ')       ||                     
             'SEQ_ID ' || 
             RPAD(' ', 33, ' ')             || 
             RPAD('SEQ_ID', 30, ' ')  ||  ','            FILA 
      FROM DUAL        
      UNION ALL  
      SELECT RPAD(' ', 07, ' ')       ||                     
             'CO.C001' || 
             RPAD(' ', 33, ' ')             || 
             RPAD('FILA', 30, ' ')  ||  ','            FILA 
      FROM DUAL        
      UNION ALL 
      SELECT 
             ----------------------------------------------------------------------------------------------
             RPAD(' ', 07, ' ')             || 
             ----------------------------------------------------------------------------------------------
             CASE 
             WHEN TC.DATA_TYPE LIKE '%NUMBER%'
             THEN RPAD( 'UT.GETNC(' || 'CO.C' || LTRIM(TO_CHAR(1+ROWNUM, '000')) || ')', 20, ' ')  
             ELSE RPAD( 'CO.C' || LTRIM(TO_CHAR(1+ROWNUM, '000')) || ' ', 20, ' ') 
             END     || 
             RPAD(' ', 20, ' ')             || 
             ----------------------------------------------------------------------------------------------
             CASE 
             WHEN TC.DATA_TYPE LIKE '%NUMBER%'
             THEN RPAD( TC.COLUMN_NAME , 30, ' ')  ||  ',' 
             ELSE RPAD(TC.COLUMN_NAME, 30, ' ')  ||  ',' 
             END     
             ----------------------------------------------------------------------------------------------
             FILA  
           --MAX(ROWNUM) OVER()                                RECUENTO 
             -- ROWNUM , 
             -- TC.COLUMN_NAME, 
             -- TC.TABLE_NAME 
        FROM ( SELECT TC.* 
                 FROM USER_TAB_COLS TC 
                WHERE TC.TABLE_NAME = I_TABLA 
                ORDER BY TC.COLUMN_ID 
             ) TC   
       WHERE TC.TABLE_NAME = I_TABLA 
      UNION ALL  
      SELECT '  FROM ' || 'APEX_COLLECTIONS CO'  FILA FROM DUAL 
      UNION ALL  
      SELECT ' WHERE ' || 'COLLECTION_NAME = ' || '''' || I_TABLA|| '''' FROM DUAL ;
     
   BEGIN
       FOR R IN CUR_DATOS LOOP 
           DBMS_OUTPUT.put_line(R.FILA);
       END LOOP; 
   END; 
   --===============================================================================================  
   PROCEDURE TEXT_ADD_MEMBER_COLL (I_TABLA IN VARCHAR2) IS 
      CURSOR CUR_DATOS IS      
      ----------------------------------------------------------------------------------------------
      SELECT 
           --RPAD('V_SEQ := APEX_COLLECTION.ADD_MEMBER (', 10 , ' ')   ||  ' '                    FILA 
             '  V_SEQ := APEX_COLLECTION.ADD_MEMBER (' || '' FILA                
      FROM DUAL UNION ALL      
      ----------------------------------------------------------------------------------------------
      SELECT 
           --RPAD('V_SEQ := APEX_COLLECTION.ADD_MEMBER (', 10 , ' ')   ||  ' '                    FILA 
             RPAD(' ', 10 , ' ')   ||  ' ' || 
             RPAD('P_COLLECTION_NAME', 21 , ' ') || 
             RPAD('=>', 20 , ' ') || 
             RPAD('''' || I_TABLA || '''' , 40 , ' ') || ','         
             FILA 
      FROM DUAL UNION ALL      
      ----------------------------------------------------------------------------------------------        
      SELECT ------------------------------------------------------
             RPAD(' ', 10 , ' ')   ||  ' '                    || 
             'P_C'                                            || 
             LTRIM(TO_CHAR(1+ROWNUM, '000'))                  || 
             ------------------------------------------------------
             RPAD(' ', 15 , ' ')                               || 
             RPAD('=>', 10 , ' ')                              || 
             ------------------------------------------------------                   
             RPAD(' ', 10, ' ')                                || 
             ------------------------------------------------------
             RPAD('R.' || TC.COLUMN_NAME, 40, ' ')             || 
             ------------------------------------------------------
             CASE 
             WHEN ROWNUM <> MAX(ROWNUM) OVER() 
             THEN ',' 
             ELSE ''
             END 
             ------------------------------------------------------                                               
                                                               FILA    
             -- MAX(ROWNUM) OVER()                                MAX_ROWNUM                                                   
                                                               
        FROM ( SELECT TC.* 
                 FROM USER_TAB_COLS TC 
                WHERE TC.TABLE_NAME = I_TABLA 
                ORDER BY TC.COLUMN_ID 
             ) TC 
       WHERE TC.TABLE_NAME = I_TABLA 
      UNION ALL  
      SELECT ------------------------------------------------------
             RPAD(' ', 11 , ' ')   ||  '); '                   FILA    
      FROM DUAL ; 
      ----------------------------------------------------------------------------------------------          
   BEGIN
       FOR R IN CUR_DATOS LOOP 
           DBMS_OUTPUT.put_line(R.FILA);
       END LOOP; 
   END; 
   --===============================================================================================       
   PROCEDURE TEXT_REC_TYPE(I_TABLA IN VARCHAR2) IS 
      CURSOR CUR_DATOS IS      
      ----------------------------------------------------------------------------------------------
      SELECT 'TYPE ' || I_TABLA || '_RT IS RECORD ('  FILA 
        FROM DUAL UNION ALL 
      SELECT 
             RPAD(' ', 5, ' ')      || ' ' ||  
             RPAD(TC.COLUMN_NAME, 30, ' ')      || ' ' ||  
             RPAD (
                   TC.DATA_TYPE ||        
                   
                   CASE 
                   WHEN TC.DATA_TYPE = 'NUMBER' AND TC.DATA_PRECISION IS NOT NULL 
                   THEN '(' || TC.DATA_PRECISION || ',' || TC.DATA_SCALE || ')' 
                   WHEN TC.DATA_TYPE = 'VARCHAR2' 
                   THEN '(' || TC.DATA_LENGTH || ')' 
                   ELSE '' 
                   END 
                   
                   
                  , 15, ' ') 
             || 
             CASE 
             WHEN ROWNUM <> MAX(ROWNUM) OVER() 
             THEN ',' 
             ELSE ' '
             END                   
             || '        -- '                          
             FILA 
             
             /*
             --------------------------------------------------------------------------------------       
             RPAD('R.' || TC.COLUMN_NAME, 30, ' ')      || ':=' ||   
             RPAD(' ', 10, ' ')           || ' '        || 
             RPAD('X.' || TC.COLUMN_NAME, 30, ' ')      || '; ' -- ||       
             UU 
             --------------------------------------------------------------------------------------          
             */ 
             
        FROM ( SELECT TC.* 
                 FROM USER_TAB_COLS TC 
                WHERE TC.TABLE_NAME = I_TABLA
                --AND TC.COLUMN_NAME LIKE 'SOLD_%'
                ORDER BY TC.COLUMN_ID 
             ) TC   
      UNION ALL 
      SELECT ');' FILA 
        FROM DUAL 
     ;
      ----------------------------------------------------------------------------------------------          
   BEGIN
       FOR R IN CUR_DATOS LOOP 
           DBMS_OUTPUT.put_line(R.FILA);
       END LOOP; 
   END; 
   --===============================================================================================       
   PROCEDURE TEXT_ASIG_VAL(I_TABLA IN VARCHAR2, I_PREF_O IN VARCHAR2 DEFAULT NULL, I_PREF_D IN VARCHAR2 DEFAULT NULL ) IS 
      CURSOR CUR_DATOS IS      
      ----------------------------------------------------------------------------------------------
      SELECT /*
             RPAD(' ', 5, ' ')      || ' ' ||  
             RPAD(TC.COLUMN_NAME, 30, ' ')      || ' ' ||  
             RPAD (
                   TC.DATA_TYPE ||        
                   
                   CASE 
                   WHEN TC.DATA_TYPE = 'NUMBER' AND TC.DATA_PRECISION IS NOT NULL 
                   THEN '(' || TC.DATA_PRECISION || ',' || TC.DATA_SCALE || ')' 
                   WHEN TC.DATA_TYPE = 'VARCHAR2' 
                   THEN '(' || TC.DATA_LENGTH || ')' 
                   ELSE '' 
                   END 
                   
                   
                  , 15, ' ') 
             || 
             CASE 
             WHEN ROWNUM <> MAX(ROWNUM) OVER() 
             THEN ',' 
             ELSE ' '
             END                   
             || '        -- ' 
             */                          
             
             RPAD(' ', 10, ' ')  || 
             --------------------------------------------------------------------------------------       
             RPAD( NVL(I_PREF_O , 'R') || '.'|| TC.COLUMN_NAME, 30, ' ')      || ':=' ||   
             RPAD(' ', 10, ' ')           || ' '        || 
             RPAD( NVL(I_PREF_D , 'X') || '.' || TC.COLUMN_NAME, 30, ' ')      || '; ' -- ||       
             FILA 
             --------------------------------------------------------------------------------------          
             
             
        FROM ( SELECT TC.* 
                 FROM USER_TAB_COLS TC 
                WHERE TC.TABLE_NAME = I_TABLA
                --AND TC.COLUMN_NAME LIKE 'SOLD_%'
                ORDER BY TC.COLUMN_ID 
             ) TC   
     ;
      ----------------------------------------------------------------------------------------------          
   BEGIN
       FOR R IN CUR_DATOS LOOP 
           DBMS_OUTPUT.put_line(R.FILA);
       END LOOP; 
   END; 
   --===============================================================================================                
begin
  -- Initialization
  NULL;
  
end XGN;
/