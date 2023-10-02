apex.gPageContext$.on( "apexafterclosedialog", function( event, data ) {
    // data contiene un elemento dialogPageId para el nro de pagina 
    let regRefresh = ['regSucSinConf', 'regListaConf'];
    regRefresh.forEach((e) => apex.region(e).refresh());
 });