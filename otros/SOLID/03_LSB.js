/**
 * Liskov Substitution Principle
 * Este principio dice que las subclases deben ser sustituibles
 * por sus clases base, es decir, los objetos de una clase deben poder ser 
 * reemplazados por los objetos de una subclase sin afectar a la corrección
 * del programa
*/
function makeRequest(url, errorHandler) {
    fetch(url)
        .then(response => response.json())
        .catch(error => {
            errorHandler.handle(error);
        });
}

const consoleErrorHandler = {
    handle: function(error){
        console.error(error);
    }
}

const externalErrorHandler = {
    handle: function( error ){
        sendErrorToExternalService( error );
    }
}

makeRequest('https://dummyjson.com/products', consoleErrorHandler);
makeRequest('https://url.data.fake.com/users', externalErrorHandler));