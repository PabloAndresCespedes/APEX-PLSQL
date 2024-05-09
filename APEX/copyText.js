// @Author: PabloACespedes C9, 09/05/2024 14:43
// Para esto se necesita HTTPS 
// o activar el dominio en chrome://flags/#unsafely-treat-insecure-origin-as-secure
// agregar el dominio http://localhost:8080
async function copyText(text){
    navigator.clipboard.writeText(text).then(() => {
      apex.message.showPageSuccess('Texto copiado correctamente: ' + text);
    },() => {
      console.error('Failed to copy');
    });
}