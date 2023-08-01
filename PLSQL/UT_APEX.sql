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
create or replace package body UT is
    --===============================================================================================
    FUNCTION GETNUM   ( I_NUMERO     IN VARCHAR2    , 
                        I_SEP_DECIM  IN VARCHAR2  DEFAULT ','
                      ) 
                      RETURN NUMBER IS 
         V_RET        NUMBER;
         V_NLS_NUM    VARCHAR2(30);
         V_FORMATO    VARCHAR2(100);
         V_SEPARADOR  VARCHAR2(10);
    BEGIN 
          
         V_FORMATO :=  '999999999999999999999D99999999999' ; 
         
         IF I_SEP_DECIM = ',' THEN 
            
            V_SEPARADOR  := ',.' ;
            V_NLS_NUM    := 'NLS_NUMERIC_CHARACTERS=' || V_SEPARADOR ||  '';
            
         ELSIF I_SEP_DECIM = '.' THEN 
            
            V_SEPARADOR  := '.,' ;
            V_NLS_NUM := 'NLS_NUMERIC_CHARACTERS=' || V_SEPARADOR ||  '';
            
         END IF;
            V_RET  := TO_NUMBER(I_NUMERO, V_FORMATO , V_NLS_NUM) ;          
            
         RETURN V_RET;
         
    END ; 
    --===============================================================================================
    FUNCTION GETNC   ( I_NUMERO     IN VARCHAR2  ) RETURN NUMBER IS 
         V_RET        NUMBER;
         V_NLS_NUM    VARCHAR2(30);
         V_FORMATO    VARCHAR2(100);
         V_SEPARADOR  VARCHAR2(10);
         I_SEP_DECIM  VARCHAR2(10);
    BEGIN 
         I_SEP_DECIM  :=  ',' ; 
          
         V_FORMATO :=  '999999999999999999999D99999999999' ; 
         
         IF I_SEP_DECIM = ',' THEN 
            
            V_SEPARADOR  := ',.' ;
            V_NLS_NUM    := 'NLS_NUMERIC_CHARACTERS=' || V_SEPARADOR ||  '';
            
         ELSIF I_SEP_DECIM = '.' THEN 
            
            V_SEPARADOR  := '.,' ;
            V_NLS_NUM := 'NLS_NUMERIC_CHARACTERS=' || V_SEPARADOR ||  '';
            
         END IF;
            V_RET  := TO_NUMBER(I_NUMERO, V_FORMATO , V_NLS_NUM) ;          
            
         RETURN V_RET;
         
    END ;    
    --===============================================================================================    
    FUNCTION GETDATE  ( I_FEC_TEXTO VARCHAR2 , 
                        I_FORMATO IN VARCHAR2 DEFAULT 'DD/MM/YYYY'                      
                      ) RETURN DATE   IS 
         V_RET DATE;
    BEGIN 
         --V_RET  := TO_NUMBER(I_NUM_TEXTO, '9999999999999D99999' , 'NLS_NUMERIC_CHARACTERS='',.''') ; 
         V_RET  := TO_DATE(I_FEC_TEXTO, I_FORMATO  ) ;
         RETURN V_RET;
    END;
    --===============================================================================================    
    FUNCTION GETCHAR  ( I_FECHA DATE , 
                        I_FORMATO IN VARCHAR2 DEFAULT 'DD/MM/YYYY'                      
                      ) RETURN VARCHAR2   IS 
         V_RET VARCHAR2(30);
    BEGIN 
         --V_RET  := TO_NUMBER(I_NUM_TEXTO, '9999999999999D99999' , 'NLS_NUMERIC_CHARACTERS='',.''') ; 
         V_RET  := TO_CHAR(I_FECHA, NVL(I_FORMATO, 'DD/MM/YYYY')  ) ;
         RETURN V_RET;
    END ; 
    --===============================================================================================        
    FUNCTION GETNUMFM (I_NUMERO IN NUMBER, IN_DECIM IN NUMBER DEFAULT 0) RETURN VARCHAR2 IS
        V_FMT_ENTERO    VARCHAR2(100)  ;
        V_FMT_DECIM     VARCHAR2(100)  ;
        V_FMT_NUMERO    VARCHAR2(100)  ;
        V_RET           VARCHAR2(300)  ;
    BEGIN

        IF IN_DECIM > 0 THEN
           V_FMT_DECIM := 'D' || RPAD('0', IN_DECIM, '0' );
        END IF;
        V_FMT_ENTERO   := '999G999G999G999G999G990';
        V_FMT_NUMERO := V_FMT_ENTERO || V_FMT_DECIM;
        /*
        DBMS_OUTPUT.put_line('V_FMT_ENTERO   =   '  ||   V_FMT_ENTERO   );
        DBMS_OUTPUT.put_line('V_FMT_DECIM    =   '  ||   V_FMT_DECIM    );
        DBMS_OUTPUT.put_line('V_FMT_NUMERO   =   '  ||   V_FMT_NUMERO   );
        */
        V_RET  := LTRIM(TO_CHAR(I_NUMERO, V_FMT_NUMERO));
        --DBMS_OUTPUT.put_line('V_RET          =   '  ||   V_RET          );

        RETURN V_RET ;
    END;
    --===============================================================================================
    FUNCTION ZEN (I_NUMERO IN NUMBER ) RETURN NUMBER IS 
    BEGIN
        IF I_NUMERO = 0 THEN 
           RETURN NULL;
        ELSE 
           RETURN I_NUMERO;
        END IF;
    END;
    --===============================================================================================         
    FUNCTION GETNF (I_NUMERO IN NUMBER, IN_DECIM IN NUMBER DEFAULT 0 ) RETURN VARCHAR2 IS 
        V_FMT_ENTERO    VARCHAR2(100)  ;
        V_FMT_DECIM     VARCHAR2(100)  ;
        V_FMT_NUMERO    VARCHAR2(100)  ;
        V_RET           VARCHAR2(300)  ;
        
    BEGIN

        IF IN_DECIM > 0 THEN
           V_FMT_DECIM := 'D' || RPAD('0', IN_DECIM, '0' );
        END IF;
        V_FMT_ENTERO   := '999G999G999G999G999G990';
        V_FMT_NUMERO := V_FMT_ENTERO || V_FMT_DECIM;
        /*
        DBMS_OUTPUT.put_line('V_FMT_ENTERO   =   '  ||   V_FMT_ENTERO   );
        DBMS_OUTPUT.put_line('V_FMT_DECIM    =   '  ||   V_FMT_DECIM    );
        DBMS_OUTPUT.put_line('V_FMT_NUMERO   =   '  ||   V_FMT_NUMERO   );
        */
        V_RET  := LTRIM(TO_CHAR(I_NUMERO, V_FMT_NUMERO));
        --DBMS_OUTPUT.put_line('V_RET          =   '  ||   V_RET          );

        RETURN V_RET ; 
    END;
    --===============================================================================================   
    FUNCTION FACNUM_FM (I_NUM_FACTURA IN NUMBER) RETURN VARCHAR2  IS                  
          V_RET VARCHAR2(20);
      BEGIN

          V_RET := LTRIM(TO_CHAR(I_NUM_FACTURA, '0000000000000'));

          V_RET := SUBSTR(V_RET, 1,3) || '-' || SUBSTR(V_RET, 4,3)  || '-' || SUBSTR(V_RET, 7,7) ;

          RETURN V_RET ;

      END;
    --=============================================================================================== 
    FUNCTION ISNUM_B(I_NUM_STR IN VARCHAR2) RETURN BOOLEAN IS  
        V_NUM_STR VARCHAR2(100);
        V_NUMERO  NUMBER;
        
        
    BEGIN
                
        IF I_NUM_STR IS NOT NULL THEN 
           
           V_NUMERO  := to_number(I_NUM_STR, '9999999999999D99', 'NLS_NUMERIC_CHARACTERS='',.''');            
           RETURN TRUE  ;           
        
        ELSE 
        
           RETURN FALSE ;
        
        END IF;
        
        
    EXCEPTION 
        WHEN OTHERS THEN 
             RETURN FALSE ;   
    END;
    --=============================================================================================== 
    FUNCTION ISNUM_S(I_NUM_STR IN VARCHAR2) RETURN VARCHAR2 IS  
        
        V_NUM_STR VARCHAR2(100);
        V_NUMERO  NUMBER;
        
        
    BEGIN
        
        IF I_NUM_STR IS NOT NULL THEN 
           
           --V_NUM_STR := (REPLACE((REPLACE(I_NUM_STR, '.', '')), ',', '.'))           
           V_NUMERO  := to_number(I_NUM_STR, '9999999999999D99', 'NLS_NUMERIC_CHARACTERS='',.'''); 
           
           RETURN 'S' ;
           
        ELSE 
           RETURN 'N' ;
        END IF;
        
        
    EXCEPTION 
        WHEN OTHERS THEN 
             RETURN 'N' ;
    END;
    --===============================================================================================    
    PROCEDURE ESPERAR(I_SEGUNDOS IN NUMBER) IS 
        V_SEG_TRANS NUMBER ;  
        FUNCTION ESPERAR_0_1_S RETURN NUMBER IS 
          curr_time1   timestamp with time zone := systimestamp;
          curr_time2   number := dbms_utility.get_time;
          v_transcrurrido number ;
        BEGIN 

          loop
            exit when current_timestamp >= curr_time1 + interval '0.1' second ; -- '5.5' 
          end loop;

          v_transcrurrido := (( dbms_utility.get_time - curr_time2 ) / 100 ) ; 
          dbms_output.put_line( 'Elapsed Time = ' || v_transcrurrido ) ;
          return v_transcrurrido; 
        END; 
        
    BEGIN
        V_SEG_TRANS := 0 ; 
        LOOP 
            V_SEG_TRANS := V_SEG_TRANS + ESPERAR_0_1_S; 
            EXIT WHEN V_SEG_TRANS >= I_SEGUNDOS; 
        END LOOP;      
    END; 
    --===============================================================================================   
         
begin
  -- Initialization
  NULL;
  
end UT;
/