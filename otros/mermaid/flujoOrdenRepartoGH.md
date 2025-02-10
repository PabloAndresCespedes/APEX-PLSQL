::: mermaid
stateDiagram-v2
    direction LR
    DEP_REP                 : DEPÓSITO DE REPARTOS
    APP_REPARTO             : App Bigon
    CONFIRMAR_ENTREGA       : Entrega registrada
    ENTREGA_TOTAL           : Total de la mercadería
    ENTREGA_PARCIAL         : Parcial de mercadería
    FACTURACION             : Facturación de la mercadería en el DEPÓSITO DE REPARTOS
    RE_FACTURACION          : Empresa del Grupo
    SOLICITUD_VENTA         : Solicitud de venta
    ERP_EMPR_HERMANA        : Procesar lista solicitudes
    FACTURACION_HERMANA     : Facturación de la mercadería
    COMPROBAR_RE_FACTURACION: Comprobar refacturados
    FACTURAR_RE_FACTURADO   : Facturar a la empresa desde el DEPÓSITO DE REPARTOS
    INGRESO_FACTURA_RE_FACT : Ingreso de factura en la empresa hermana también en el DEPÓSITO DE REPARTOS
    INGRESO_DEVOLUCION      : Devoluciones sin facturar o entregar
    DEP_DEVOLUCION          : Traslado del DEPÓSITO DE REPARTOS al DEPÓSITO VIRTUAL DE DEVOLUCIÓN
    [*] --> DEP_REP: Generación de reparto por Orden de Carga
    DEP_REP --> APP_REPARTO: Sincronización lista mercadería y bloqueo en depósito ERP
    APP_REPARTO --> CONFIRMAR_ENTREGA

    CONFIRMAR_ENTREGA --> ENTREGA_TOTAL
    CONFIRMAR_ENTREGA --> ENTREGA_PARCIAL 
    ENTREGA_TOTAL     --> FACTURACION: Sinc. al ERP
    ENTREGA_PARCIAL   --> FACTURACION: Sinc. al ERP
    FACTURACION       --> [*]

    ENTREGA_PARCIAL --> RE_FACTURACION: Sobrantes disponibles
    state RE_FACTURACION {
        [*] --> SOLICITUD_VENTA: Creación
        SOLICITUD_VENTA --> ERP_EMPR_HERMANA: Sincronización al ERP
        state if_solicitud_aprobada <<choice>>
        ERP_EMPR_HERMANA --> if_solicitud_aprobada: Validaciones generales
        if_solicitud_aprobada --> FACTURACION_HERMANA: Aprobación
        if_solicitud_aprobada --> Rechazado : Rechazo
        Rechazado --> [*]: Notificación App
        FACTURACION_HERMANA --> [*]: Notificación App
    }

    RE_FACTURACION --> COMPROBAR_RE_FACTURACION: Hay solicitudes facturadas
    COMPROBAR_RE_FACTURACION --> FACTURAR_RE_FACTURADO
    FACTURAR_RE_FACTURADO --> INGRESO_FACTURA_RE_FACT
    INGRESO_FACTURA_RE_FACT --> [*]

    CONFIRMAR_ENTREGA   --> INGRESO_DEVOLUCION
    INGRESO_DEVOLUCION  --> DEP_DEVOLUCION: Sinc. al ERP
    DEP_DEVOLUCION      --> [*]
:::