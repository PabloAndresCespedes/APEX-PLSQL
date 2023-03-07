/**
 * va ligado con ./PLSQL/serverProcess.sql
 */
apex.server.process( 'GET_DATA_EMP',
    { pageItems:'#P13_DEPT',
      x01: apex.items.P13_DEPT.getValue()
    },  // Parameter to be passed to the server
    {
        success: function (pData) {             // Success
            console.log(pData);
            apex.items.P13_EMP.setValue(pData.empno);
            apex.items.P13_SAL.setValue(pData.sal);
        },
        error: function(e){
            console.log("Error: ", e);
        },
        dataType: "json"                        // Response type
    }
);
