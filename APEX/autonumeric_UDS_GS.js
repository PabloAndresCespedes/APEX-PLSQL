/*
  @PabloACespedes un 10/12/2022 18:42
  Modularización de JS para Oracle APEX
  Archivo utilitario para formateo de mascaras de
  items numericos con librería Autonumeric
  Libreria: https://github.com/autoNumeric/autoNumeric/blob/next/LICENSE
  ---
  Decimales GS >> 0 Ej: 100.000 
  Decimal USD  >> 2 Ej: 100.000,00
  ---
  Agradecimientos a Vincent Morneau https://github.com/vincentmorneau
  --
  07.03.2023 16:30 se agrega libreria Autonumeric en lib/autoNumeric.min.js
*/
const classNameFormat = 'formatMnd';

const af = {};

const cantDecimalGs = 0;

af.init = function (){
	$(`.${classNameFormat}`).autoNumeric('init', {
	    decimalCharacter: ",",
	    decimalPlacesOverride: cantDecimalGs,
	    digitGroupSeparator: "."
	});
}

const change = {};

change.mnd = {
	GS: function(){
		$(`.${classNameFormat}`).autoNumeric('update', {
            decimalPlacesOverride: cantDecimalGs
        });
	},

	USD: function(){
		const cantDecimalUsd = 2;

		$(`.${classNameFormat}`).autoNumeric('update', {
            decimalPlacesOverride: cantDecimalUsd
        });
	}
}

const upd = {};

upd.item = function({itemMoneda}){
	$(`#${itemMoneda}`).change(function () {
        
	    codMnd = apex.item(itemMoneda).getValue();

	    codMnd == 1 ? change.mnd.GS() : change.mnd.USD();
	});
}