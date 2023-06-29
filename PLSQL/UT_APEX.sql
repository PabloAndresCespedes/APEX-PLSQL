create or replace package UT is
  
  -- Author  : Antonio N.
  -- Created : 25/05/2021 02:02:08 p. m.
  -- Purpose : Funciones utiles para simplificar codigo.. 
  
    
    FUNCTION GETNUM   ( I_NUMERO     IN VARCHAR2    , 
                        I_SEP_DECIM  IN VARCHAR2  DEFAULT ','
                      ) RETURN NUMBER ; 
    
    FUNCTION GETNC    ( I_NUMERO     IN VARCHAR2  ) RETURN NUMBER ;
    
    FUNCTION GETDATE  ( I_FEC_TEXTO VARCHAR2 , 
                        I_FORMATO IN VARCHAR2 DEFAULT 'DD/MM/YYYY'                      
                       ) RETURN DATE   ; 
                       
    FUNCTION GETCHAR  ( I_FECHA DATE , 
                        I_FORMATO IN VARCHAR2 DEFAULT 'DD/MM/YYYY'                      
                      ) RETURN VARCHAR2   ;
                      
    FUNCTION GETNUMFM (I_NUMERO IN NUMBER, IN_DECIM IN NUMBER DEFAULT 0 ) RETURN VARCHAR2 ;
    
    FUNCTION GETNF    (I_NUMERO IN NUMBER, IN_DECIM IN NUMBER DEFAULT 0 ) RETURN VARCHAR2 ;    
        
    FUNCTION ZEN (I_NUMERO IN NUMBER ) RETURN NUMBER ;
    
    FUNCTION FACNUM_FM (I_NUM_FACTURA IN NUMBER) RETURN VARCHAR2 ;
    
    FUNCTION ISNUM_B(I_NUM_STR IN VARCHAR2) RETURN BOOLEAN  ; 
    
    FUNCTION ISNUM_S(I_NUM_STR IN VARCHAR2) RETURN VARCHAR2 ;

    PROCEDURE ESPERAR(I_SEGUNDOS IN NUMBER) ; 
    
end UT;
/
create or replace package UT is
  
  -- Author  : Antonio N.
  -- Created : 25/05/2021 02:02:08 p. m.
  -- Purpose : Funciones utiles para simplificar codigo.. 
  
    
    FUNCTION GETNUM   ( I_NUMERO     IN VARCHAR2    , 
                        I_SEP_DECIM  IN VARCHAR2  DEFAULT ','
                      ) RETURN NUMBER ; 
    
    FUNCTION GETNC    ( I_NUMERO     IN VARCHAR2  ) RETURN NUMBER ;
    
    FUNCTION GETDATE  ( I_FEC_TEXTO VARCHAR2 , 
                        I_FORMATO IN VARCHAR2 DEFAULT 'DD/MM/YYYY'                      
                       ) RETURN DATE   ; 
                       
    FUNCTION GETCHAR  ( I_FECHA DATE , 
                        I_FORMATO IN VARCHAR2 DEFAULT 'DD/MM/YYYY'                      
                      ) RETURN VARCHAR2   ;
                      
    FUNCTION GETNUMFM (I_NUMERO IN NUMBER, IN_DECIM IN NUMBER DEFAULT 0 ) RETURN VARCHAR2 ;
    
    FUNCTION GETNF    (I_NUMERO IN NUMBER, IN_DECIM IN NUMBER DEFAULT 0 ) RETURN VARCHAR2 ;    
        
    FUNCTION ZEN (I_NUMERO IN NUMBER ) RETURN NUMBER ;
    
    FUNCTION FACNUM_FM (I_NUM_FACTURA IN NUMBER) RETURN VARCHAR2 ;
    
    FUNCTION ISNUM_B(I_NUM_STR IN VARCHAR2) RETURN BOOLEAN  ; 
    
    FUNCTION ISNUM_S(I_NUM_STR IN VARCHAR2) RETURN VARCHAR2 ;

    PROCEDURE ESPERAR(I_SEGUNDOS IN NUMBER) ; 
    
end UT;
/