<br>Acción<br/><input type="checkbox" class="boxes cursor" style="transform:scale(1.2);" onclick="javascript:$f_CheckAll(this, this.checked, $('[name=f01]'));">

```
APEX_ITEM.CHECKBOX2(P_IDX        => 1,
                           P_VALUE      => FCON_CLAVE,
                           P_ATTRIBUTES => 'class="boxes cursor" style="transform:scale(1.2);"') HABILITAR
```

```
FOR I IN 1 .. APEX_APPLICATION.G_F01.COUNT LOOP
    INSERT INTO TABLA
    (DATO_CHECK)
    VALUES
    (APEX_APPLICATION.G_F01(I));
END LOOP;
```

$('[name=f01]').each( function () {
   if (this.checked) {
     l_cont = ( l_cont + 1 );
       
     let seqId = $(this).val();
       
       apex.server.process('remArtSinExistencia',
          {
              x01: seqId
          }
          , {success: function(pData){
                  if (pData.ind_error == 1){
                      showSweet({msg:pData.error});
                  }else{ 
                      apex.region('listado').refresh();
                  }
              }
          }
      );
   }
});

if (l_cont == 0){
    const MSG_SELECCION = 'Es necesario seleccionar un registro para remover de la lista';
    showSweet({msg: MSG_SELECCION});
}else{
    apex.region('regExistDep').refresh();
}
