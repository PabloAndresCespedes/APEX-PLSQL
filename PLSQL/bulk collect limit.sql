-- Created on 19/08/2024 by @PabloACespedes 
-- Ref. https://blogs.oracle.com/connect/post/bulk-processing-with-bulk-collect-and-forall
declare 
  k_limit           pls_integer := 5000;
  
  l_fullwms_empresa varchar2( 10 char);
  l_fullwms_cd      varchar2( 10 char);
  l_fullwms_almox   varchar2( 10 char);
  
  cursor c_stock_wms (
    in_fullwms_empresa in varchar2
  , in_fullwms_cd      in varchar2
  , in_fullwms_almox   in varchar2
  )is
    select *
    from v_custom_wms_ests_disp_hilagro@wms x
    where x.emp   = in_fullwms_empresa
    and   x.cd    = in_fullwms_cd
    and   x.almox = in_fullwms_almox
    ;
  
  type stock_wms_tab is table of c_stock_wms%rowtype index by pls_integer;
  
  l_lista_stock_wms stock_wms_tab;
  
begin
  l_fullwms_empresa := '1';
  l_fullwms_cd      := '1';
  l_fullwms_almox   := '1';
  
  open c_stock_wms(
    in_fullwms_empresa => l_fullwms_empresa --> varchar2
  , in_fullwms_cd      => l_fullwms_cd      --> varchar2
  , in_fullwms_almox   => l_fullwms_almox   --> varchar2
  );
  loop
    fetch c_stock_wms
    bulk collect into l_lista_stock_wms
    limit k_limit;
    
    exit when l_lista_stock_wms.count = 0;
    
    print(l_lista_stock_wms.count);
    
  end loop;
  
end;