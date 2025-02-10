/**
  Gemini [input: sacar promedio de horas con interval oracle]
  Explicación:

    EXTRACT(HOUR FROM duracion): Extrae las horas del intervalo.
    EXTRACT(MINUTE FROM duracion): Extrae los minutos del intervalo.
    EXTRACT(SECOND FROM duracion): Extrae los segundos del intervalo.
    AVG(...): Calcula el promedio de los segundos.
    NUMTODSINTERVAL(..., 'SECOND'): Convierte el promedio de segundos a un intervalo de tiempo.
    TO_CHAR(..., 'HH24:MI:SS'): Formatea el intervalo de tiempo a HH:MM:SS.
    Consideraciones adicionales:

    Asegúrate de que la columna duracion tenga el tipo de datos adecuado para almacenar intervalos de tiempo (por ejemplo, INTERVAL DAY TO SECOND).
    Puedes adaptar esta consulta para incluir filtros o agrupaciones según tus necesidades.
*/
select to_char( min( jd.log_date ), 'DD/MM/YYYY HH24:MI:SS') as primer_ejecucion
,      to_char( max( jd.LOG_DATE ), 'DD/MM/YYYY HH24:MI:SS') as ultima_ejecucion 
,      count( 1 )                                            as total_ejecuciones
,      REGEXP_SUBSTR(
         to_char(numtodsinterval(avg(extract(hour   from jd.run_duration) * 3600 +
                                     extract(minute from jd.run_duration) * 60 +
                                     extract(second from jd.run_duration)),
                                 'SECOND'),
                 'HH24:MI:SS'
                 )
       , '\d{1} \d{2}:\d{2}:\d{2}'
       ) as promedio_duracion

from all_scheduler_job_run_details jd
where trunc(jd.log_date) between to_date('01/11/2024', 'dd/mm/yyyy') and to_date('28/02/2025', 'dd/mm/yyyy')
and jd.job_name = 'HA_JOB_GEN_REFRESH_VISTAS_NOCH'
and jd.status = 'SUCCEEDED'