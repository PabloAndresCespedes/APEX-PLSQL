// Chapter 6: Eloquent JavaScript
// La vida secreta de los objetos
// Methods
console.log('====================================================');
let conejo = {ciudad: "C9"};

conejo.hablar = function(line) {
  console.log(`El conejo dice '${line}' de la ciudad de ${this.ciudad}`);
}

conejo.hablar("Estoy vivo"); // → El conejo dice 'Estoy vivo'

function hablar (line) {
  console.log(`El ${this.tipo} conejo dice '${line}'`);
}

let conejoBlanco = {tipo: "blanco", hablar};
let conejoHambriento = {tipo: "hambriento", hablar};

console.log('====================================================');
conejoBlanco.hablar("Soy un conejo blanco"); // → El blanco conejo dice 'Soy un conejo blanco'
conejoHambriento.hablar("Estoy hambriento"); // → El hambriento conejo dice 'Estoy hambriento'
console.log('====================================================');


