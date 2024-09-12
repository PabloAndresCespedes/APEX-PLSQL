### Aqui también hay una referencia para conectar el PLSQL Developer con la billetera del Autonomus

1- Guardar TNSNAMES.ORA actual en una ubicación diferente para que no se_borre.

2- Instalar  : Oracle Database 19c Client (19.3) for Microsoft Windows x64 (64-bit)
2.1- link      : https://www.oracle.com/database/technologies/oracle19c-windows-downloads.html

3- Descomprimir en una carpeta que no debe moverse o borrarse.

4- Tras la instalacion ubicar los archivos:
 4.1- SQLNET.ORA: Colocar WALLET_LOCATION en la carpeta
  de sus billeteras de conexion. Para windows utilizar doble comillas y contrabarras
                WALLET_LOCATION = (SOURCE = (METHOD = file) (METHOD_DATA = (DIRECTORY="C:\\OCIOracleWallets\\SIMUXOCI"))) SSL_SERVER_DN_MATCH=yes
                
 4.2- TNSNAMES.ORA: Reemplazar por su copia
 