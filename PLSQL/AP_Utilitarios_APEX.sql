create or replace package AP is

  -- Author  : Antonio N.
  -- Created : 25/05/2021 02:02:08 p. m.
  -- Purpose : Funciones utiles para simplificar codigo.. 
  
    
    FUNCTION   V  ( p_item  in varchar ) RETURN VARCHAR2 ; 
  
    FUNCTION   NV ( p_item  in varchar ) RETURN NUMBER  ; 
  
    PROCEDURE  SV ( p_item  in varchar2 , p_value in varchar2 := NULL) ; 
    
    FUNCTION   GETNC   ( P_ITEM IN VARCHAR2 ) RETURN NUMBER ;    
    FUNCTION   GETNP   ( P_ITEM IN VARCHAR2 ) RETURN NUMBER ;        
    PROCEDURE  SETNC   ( P_ITEM IN VARCHAR2 , P_NUM IN NUMBER, P_DEC IN NUMBER DEFAULT 0 ) ; 
    
  --PROCEDURE  SETFN_P  ( P_ITEM IN VARCHAR2 , P_NUM IN NUMBER, P_DEC IN NUMBER DEFAULT 0 ) ; 
    
end AP;
/
create or replace package body AP is

    --===============================================================================================    
    FUNCTION V ( p_item  in varchar ) RETURN VARCHAR2 IS
        l_item_value VARCHAR2 (4000);
    BEGIN

        l_item_value := APEX_UTIL.GET_SESSION_STATE (p_item);
        RETURN l_item_value;

    END;
    --===============================================================================================
    FUNCTION NV ( p_item  in varchar ) RETURN NUMBER IS
        l_item_value NUMBER;
    BEGIN

        l_item_value := APEX_UTIL.GET_NUMERIC_SESSION_STATE (p_item);
        RETURN l_item_value;

    END;
    --===============================================================================================
    PROCEDURE SV ( p_item  in varchar2 , p_value in varchar2 := NULL) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
          APEX_UTIL.set_session_state
            (  p_name  => p_item  ,
               p_value => p_value
            );
          COMMIT;
          
    END ;
    --===============================================================================================
    FUNCTION GETNC  ( P_ITEM IN VARCHAR2 ) RETURN NUMBER IS 
        V_VAL   VARCHAR2(2000) ;  
        V_RET   NUMBER         ;     
    BEGIN        
        V_VAL   := V(P_ITEM);
        V_RET   := UT.GETNUM(V_VAL, ',');        
        RETURN V_RET;        
    END; 
    --===============================================================================================    
    FUNCTION GETNP  ( P_ITEM IN VARCHAR2 ) RETURN NUMBER IS 
        V_VAL   VARCHAR2(2000);  
        V_RET   NUMBER;        
    BEGIN
        V_VAL   := V(P_ITEM);        
        V_RET   := UT.GETNUM(V_VAL, ',');
        RETURN V_RET;
    END;    
    --===============================================================================================
    PROCEDURE  SETNC   ( P_ITEM IN VARCHAR2 , P_NUM IN NUMBER, P_DEC IN NUMBER DEFAULT 0 ) IS 
    BEGIN   
        SV(P_ITEM, UT.GETNF(P_NUM, P_DEC)) ; 
    END; 
    --===============================================================================================
    --PROCEDURE  SETFN_P  ( P_ITEM IN VARCHAR2 , P_VALUE IN NUMBER ) ; 
        
begin
  -- Initialization
  NULL;
  
end AP;
/