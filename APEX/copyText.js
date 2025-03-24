// @Author: PabloACespedes C9, 09/05/2024 14:43
// Para esto se necesita HTTPS 
// o activar el dominio en chrome://flags/#unsafely-treat-insecure-origin-as-secure
// agregar el dominio http://localhost:8080
async function writeClipboardText(text) {
  try {
      await navigator.clipboard.writeText(text);
  } catch (error) {
      console.error(error.message);
  }
}


// Utilizacion llamar accion dinamica con el siguiente codigo
// Esto obtiene el valor de un item y lo envia a la funcion
let l_contenido = apex.item('P777_RESULT').getValue();

writeClipboardText(l_contenido).then(() => {apex.message.showPageSuccess( "Copiado en cortapapeles!" );});