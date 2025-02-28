### Información general
- Esta integración es entre la base de datos del ERP en 19c y el OCI 18c.
- En ambas bases de datos existen 2 tablas y 1 paquetería de librería:
        - Tabla wmsc_archivos_enviados.
        - Tabla wmsc_archivos_recibidos.
        - Paquete pkg_procesos_rest.
- Estas alojan los archivos TXT con contenido JSON que son sincronizadas.

### Sincronización de envío.
#### ERP y OCI:
1. Establecer los datos que se necesitan sincronizar.
2. Realizar proceso que escribe un JSON de envío.
3. Crear una constante como identificador unico de la sincronización en "**pkg_procesos_rest**".
4. Para enviar es necesario insertar el JSON en la tabla "**wmsc_archivos_enviados**". Ejemplo: 
```
   pkg_sincronizacion_wmsc.agregar_archivo_enviados(
        in_empresa => 1                                    --> Empresa propietaria Hilagro
    ,   in_proceso => pkg_procesos_rest.k_entradas_cliente --> Nombre del proceso unico
    ,   in_file    => l_json_blob                          --> Archivo Blob que contiene el TXT con contenido JSON
   );
```

### Recepción de sincronización.
#### OCI
1. También dentro del paquete "**pkg_procesos_rest**" será necesario crear la misma constante que para su envío.
2. Generar un proceso que trate el TXT con contenido JSON. Ejemplo 
```
    --== Aqui recibe el BLOB y su ID unico de tabla de WMS_ARCHIVOS_RECIBIDOS
    pkg_procesar_archivos.entradas_clientes(
      in_json => i.archive
    , in_id_archivo => i.id
    );
```
3. Todos los procesamientos para tratar la recepción de datos se encuentran en "**PKG_PROCESAR_ARCHIVOS**". Estos tratan el TXT y marcan como procesado tras recorrer todo el archivo de forma satisfactoria.
#### ERP
1. Generar un proceso de recepción que tratará el TXT. 
2. Centralizar los procesos en "**PKG_WMSC_REST**" de recepción.
3. El proceso automático (Job) estará llamandose desde "**PKG_WMSC_CONF_JOB**" donde será necesario agregar el proceso que trata el TXT.