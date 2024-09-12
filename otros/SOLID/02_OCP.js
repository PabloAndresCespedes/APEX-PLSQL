/**
 * Open/Closed Principle
 * Sostiene que las entidades de software, clases, módulos,
 * funciones deben estar abiertas para su extensión pero
 * cerradas para su modificación
*/

function processPaymentWithCard(price, cardDetails) {
    console.log(`Processing payment of ${price} with credit card...`);
}

function processPaymentWithPayPal(price, paypalDetails) {
    console.log(`Processing payment of ${price} with PayPal...`);
}