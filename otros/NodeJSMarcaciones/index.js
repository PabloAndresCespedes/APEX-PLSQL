const express = require('express');
const axios = require('axios');
const cron = require('node-cron');
const app = express();
const port = 2700;

app.use(express.json()); // Middleware para parsear JSON en el body de las peticiones

const l_doc_ci = 5253581; // Número de cedula del colaborador

//==============================================================================================================
    const realizarPost = (marcacionEvento) => {
        const data = {
            "marcacionEvento": marcacionEvento,
            "documento": l_doc_ci
        };
        // este endpoint esta en Consultagro S.A., y necesitamos estar con la VPN activa
        axios.post('http://10.168.0.16:8080/ords/cagro/capHum/agregarMarcacion', data)
            .then(response => {
                console.log('Petición POST exitosa:', response.data);
            })
            .catch(error => {
                res.status(500).send('Error al enviar datos: ' + error);
            });
    };

//==============================================================================================================
    // Referencia de horarios en https://crontab.guru/
    const HS_MARCACION = {
        DOMINGO: {
            DIURNO_ENTRADA: '00 6 * * *', // 06:00
            DIURNO_SALIDA: '00 12 * * * ', // 12:00
            VESPERTINO_ENTRADA: '00 13 * * *', // 13:00
            VESPERTINO_SALIDA: '00 17 * * * ', // 17:00
        },
        LUNES: {
            DIURNO_ENTRADA: '53 6 * * *', // 06:53
            DIURNO_SALIDA: '01 12 * * * ', // 12:01
            VESPERTINO_ENTRADA: '57 12 * * *', // 12:57
            VESPERTINO_SALIDA: '02 17 * * * ', // 17:02
        },
        MARTES: {
            DIURNO_ENTRADA: '55 6 * * *', // 06:55
            DIURNO_SALIDA: '03 12 * * *', // 12:03
            VESPERTINO_ENTRADA: '52 12 * * *', // 12:52
            VESPERTINO_SALIDA: '01 17 * * *', // 17:01
        },
        MIERCOLES: {
            DIURNO_ENTRADA: '59 6 * * *', // 06:59
            DIURNO_SALIDA: '05 12 * * *', // 12:05
            VESPERTINO_ENTRADA: '57 12 * * *', // 12:57
            VESPERTINO_SALIDA: '15 17 * * *', // 17:15
        },
        JUEVES: {
            DIURNO_ENTRADA: '55 6 * * *', // 06:55
            DIURNO_SALIDA: '03 12 * * *', // 12:03
            VESPERTINO_ENTRADA: '52 12 * * *', // 12:52
            VESPERTINO_SALIDA: '01 17 * * *', // 17:01
        },
        VIERNES: {
            DIURNO_ENTRADA: '55 6 * * *', // 06:55
            DIURNO_SALIDA: '03 12 * * *', // 12:03
            VESPERTINO_ENTRADA: '55 12 * * *', // 12:55
            VESPERTINO_SALIDA: '03 17 * * *', // 17:03
        },
        SABADO: {
            DIURNO_ENTRADA: '59 6 * * *', // 06:59
            DIURNO_SALIDA: '07 12 * * *', // 12:07
            VESPERTINO_ENTRADA: '52 12 * * *', // 12:52
            VESPERTINO_SALIDA: '00 17 * * *', // 17:00
        }
  };
//==============================================================================================================
    function obtenerMarcacionHoy(marcacion) {
        const diasSemana = ['DOMINGO', 'LUNES', 'MARTES', 'MIERCOLES', 'JUEVES', 'VIERNES', 'SABADO'];
        const hoy = new Date();
        const nombreDia = diasSemana[hoy.getDay()];

        return marcacion[nombreDia];
    }
    
    const marcacionHoy = obtenerMarcacionHoy(HS_MARCACION);
    
    const getRandomInt = (min, max) => {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    };
    function generarSegundosAleatorios() {
        return getRandomInt(1, 11) * 1000; // Convertir segundos a milisegundos
    }

//==============================================================================================================
    cron.schedule(marcacionHoy.DIURNO_ENTRADA, () => { 
        console.log('Ejecutando tarea programada DIURNO_ENTRADA...');
        setTimeout(() => {
            realizarPost("E");
        }, generarSegundosAleatorios());
    });

    cron.schedule(marcacionHoy.DIURNO_SALIDA, () => { 
        console.log('Ejecutando tarea programada DIURNO_SALIDA...');
        setTimeout(() => {
            realizarPost("S");
        }, generarSegundosAleatorios());
    });

    cron.schedule(marcacionHoy.VESPERTINO_ENTRADA, () => { 
        console.log('Ejecutando tarea programada VESPERTINO_ENTRADA...');
        setTimeout(() => {
            realizarPost("E");
        }, generarSegundosAleatorios());
    });

    cron.schedule(marcacionHoy.VESPERTINO_SALIDA, () => { 
        console.log('Ejecutando tarea programada VESPERTINO_SALIDA...');
        setTimeout(() => {
            realizarPost("S");
        }, generarSegundosAleatorios());
    });
//==============================================================================================================
    app.listen(port, () => {
        console.log(`Servidor escuchando en el puerto ${port}`);
    });
//==============================================================================================================