<br>Accionar<br/><input type="checkbox" style="transform:scale(1.2);" onclick="javascript:$f_CheckAll(this, this.checked, $('[name=f01]'));">

```
APEX_ITEM.CHECKBOX2(P_IDX        => 1,
                           P_VALUE      => FCON_CLAVE,
                           P_ATTRIBUTES => 'class="boxes"') HABILITAR
```

```
FOR I IN 1 .. APEX_APPLICATION.G_F01.COUNT LOOP
    INSERT INTO TABLA
    (DATO_CHECK)
    VALUES
    (APEX_APPLICATION.G_F01(I));
END LOOP;
```