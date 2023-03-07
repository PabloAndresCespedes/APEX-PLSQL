function splitError({errorMsg, positionArray, divisorSplit}){
    /*
      guardamos en un array los datos divididos por el argumento divisorSplit
      Ejemplo: 
      1:
      - errorMsg: PXX_ITEM:TEXTO_ERROR_PLSQL
      - positionArray: 0
      - Resultado Return: PXX_ITEM
      2:
      - errorMsg: PXX_ITEM:TEXTO_ERROR_PLSQL
      - positionArray: 1
      - Resultado Return: TEXTO_ERROR_PLSQL
    */
    const myArray = errorMsg.split(divisorSplit);
    return myArray[positionArray];
  }
  