function showSweet({msg}){
    Swal.fire({
      icon: 'warning',
      title: 'ATENCIÓN!',
      width: '650px',
      html: msg
    });
}

// utilizacion en dinamyc action
let iError = apex.item('P189_F_ERROR');

if ( iError.isEmpty()){
    apex.region('regList').refresh();
    apex.item('P189_F_CTA_BANCARIA').setValue(null, null, true);
    apex.item('P189_F_NRO_CTA_BANCARIA').setValue(null);
    apex.item('P189_F_CORREO').setValue(null);
    apex.item('P189_F_CONTRATO').setValue(null);
}else{
    showSweet({msg: iError.getValue()});
}