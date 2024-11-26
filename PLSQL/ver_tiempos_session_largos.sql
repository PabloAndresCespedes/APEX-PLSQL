-- Opcion uno: @CarlosAquino
select distinct
 'ALTER SYSTEM KILL SESSION '||''''||a.SID||', '||a.SERIAL#||''''||';' MATA,
 a.sid,
 a.serial#,
 a.username,
 a.last_call_et,
 to_char(sysdate-a.last_call_et/24/60/60,'hh24:mi:ss') started,
 trunc(a.last_call_et/60) || ' mins, ' || mod(a.last_call_et,60) || ' secs' dur,
 trunc(a.last_call_et/60) minutos,
 mod(a.last_call_et,60) segundos,
 b.sql_text ,
 a.SCHEMANAME ,
 a.MODULE,
 a.action,
 a.client_info,
 a.client_identifier,
 a.state,
 a.osuser
 --b.sql_fulltext
from v$sql b, v$session a
where a.status = 'ACTIVE'
and a.sql_address = b.address(+)
AND a.username IS NOT NULL
AND trunc(a.last_call_et/60) >= 1
ORDER BY minutos DESC, segundos desc;

--- opcion dos: @APeralta
select lock1.sid ID_BLOQUEADOR,
       username,
       TERMINAL,
       NVL(SUBSTR(S.CLIENT_INFO, INSTR(S.CLIENT_INFO, ':') + 1), username) USUARIO,
       CLIENT_INFO,
       ' BLOQUEA ' INDICADOR,
       lock2.sid ID_BLOQUEADO,
       D.OBJECT_NAME
  from v$lock          lock1,
       v$lock          lock2,
       V$SESSION       S,
       V$LOCKED_OBJECT C,
       dba_objects     D
 where lock1.block = 1
   and lock2.request > 0
   and lock1.id1 = lock2.id1
   and lock1.id2 = lock2.id2
   and lock1.sid = s.SID
   AND LOCK1.SID = C.SESSION_ID(+)
   AND C.OBJECT_ID = D.OBJECT_ID(+)

-- opcion tres: @JorgeV
select * from v$locked_object v, all_objects u where v.OBJECT_ID=u.OBJECT_ID and u.OWNER = 'ADCS';