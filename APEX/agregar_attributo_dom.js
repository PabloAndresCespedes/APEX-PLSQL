let allEl = document.querySelectorAll('.ui-btn');

allEl.forEach(element => element.setAttribute("target", "_blank"));

// agregar clase vanilla JS
let allEl = document.querySelectorAll('.a-IRR-aggregate-value');

allEl.forEach(element => element.classList.add("u-pullRight"));


// obt id de span id. Ejemplo de elemento en HTML <span class="imgBarCode" id="0000000006736"></span>

var idArr = [];

$(".imgBarCode").each(function(){
    idArr.push($(this).attr("id"));
});

console.log(idArr.join(", "));