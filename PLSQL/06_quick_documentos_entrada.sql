documentos_entrada
  empresa_id /fk empresas
  suc_id /fk sucursales
  tipo_mov_id /fk tipos_mov
  fecha_emision date /nn
  nro num /nn
  proveedor_id /fk proveedores /nn
  razon_social vc255
  ruc vc25
  dir vc50
  tel vc50
  mail vc50

docs_entradas_det
  doc_ent_id /fk documentos_entrada /nn
  item num /nn
  concepto_id /fk conceptos