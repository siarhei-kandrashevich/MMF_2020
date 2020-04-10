DEFINE USER_NAME = &&1
DEFINE TBS_LOCATION =  &&2
DEFINE TBS_TYPE =  &&3

PROMPT Script info:
select sys_context('USERENV', 'MODULE') from dual; 
PROMPT

SET SERVEROUTPUT ON
DECLARE
    l_sql VARCHAR2(4000);
    l_tbs_name VARCHAR2(500) := '&&USER_NAME'||'_'||'&&TBS_TYPE';
    l_file_name VARCHAR2(500) := '&&TBS_LOCATION'||l_tbs_name||'.dbf';
BEGIN
---    l_tbs_name := &&USER_NAME||'_'||&&TBS_TYPE;
--    l_file_name := &&TBS_LOCATION||l_tbs_name||'.dbf';
    -- Сообщение для лога
    DBMS_OUTPUT.PUT_LINE('Creating new tablespace: '||l_tbs_name);
    -- Собираем строку для создания табличного пространства
    l_sql:='CREATE SMALLFILE TABLESPACE '||l_tbs_name||' DATAFILE '''||l_file_name||''' SIZE 10M AUTOEXTEND ON NEXT 10M MAXSIZE 10G EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO';
    -- Сообщение для лога
    DBMS_OUTPUT.PUT_LINE('Script to create tablespace: '||l_sql);
    -- Создаём табличное пространство
    EXECUTE IMMEDIATE l_sql;
END;
/ 
SET SERVEROUTPUT OFF