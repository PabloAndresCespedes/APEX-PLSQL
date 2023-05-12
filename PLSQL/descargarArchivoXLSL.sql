/*
* @PabloACespedes 04/05/2023 09:56
* Generamos primeramente un AJAX Callback a nivel de pagina o aplicacion
* dentro de el declaramos el proceso a ser llamado
* URL LLAMADA, PARA INVOCAR AJAX >> f?p=&APP_ID.:0:&SESSION.:APPLICATION_PROCESS=STKL715_DESCARGAR_CSV:NO
*/
DECLARE
    L_BLOB           BLOB;
    L_CLOB           CLOB;
    L_DEST_OFFSET    INTEGER := 1;
    L_SRC_OFFSET     INTEGER := 1;
    L_LANG_CONTEXT   INTEGER := DBMS_LOB.DEFAULT_LANG_CTX;
    L_WARNING        INTEGER;
    L_LENGTH         INTEGER;
BEGIN

    -- create new temporary BLOB
    DBMS_LOB.CREATETEMPORARY(L_BLOB, FALSE);

    --get CLOB
    ARTICULO_OT_Csv( L_CLOB );

    -- tranform the input CLOB into a BLOB of the desired charset
    DBMS_LOB.CONVERTTOBLOB( DEST_LOB     => L_BLOB,
                            SRC_CLOB     => L_CLOB,
                            AMOUNT       => DBMS_LOB.LOBMAXSIZE,
                            DEST_OFFSET  => L_DEST_OFFSET,
                            SRC_OFFSET   => L_SRC_OFFSET,
                            BLOB_CSID    => NLS_CHARSET_ID('WE8MSWIN1252'),
                            LANG_CONTEXT => L_LANG_CONTEXT,
                            WARNING      => L_WARNING
                            );

    -- determine length for header
    L_LENGTH := DBMS_LOB.GETLENGTH(L_BLOB);  

    -- first clear the header
    HTP.FLUSH;
    HTP.INIT;

    -- create response header
    OWA_UTIL.MIME_HEADER( 'text/csv', FALSE);

    HTP.P('Content-length: ' || L_LENGTH);
    HTP.P('Content-Disposition: attachment; filename="articulo_data.xls"');
    HTP.P('Set-Cookie: fileDownload=true; path=/');

    OWA_UTIL.HTTP_HEADER_CLOSE;

    -- download the BLOB
    WPG_DOCLOAD.DOWNLOAD_FILE( L_BLOB );

    -- stop APEX
    -- APEX_APPLICATION.STOP_APEX_ENGINE;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_LOB.FREETEMPORARY(L_BLOB);
        RAISE;
END;