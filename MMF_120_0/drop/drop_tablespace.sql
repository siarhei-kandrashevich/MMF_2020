PROMPT
PROMPT Script start: drop_tablespace.sql
PROMPT

PROMPT Script info:
select sys_context('USERENV', 'MODULE') from dual; 
PROMPT

DECLARE
    l_tbs_exists   NUMBER(1);
    l_sql          VARCHAR2(4000);
    l_tbs_name     VARCHAR2(500) := '&&1._&&2';
	l_script_name  VARCHAR2(50) := 'drop_tablespaces.sql';
BEGIN
    DBMS_OUTPUT.PUT_LINE(l_script_name || '- Iput parameter Tablespace Name = '||l_tbs_name);
    DBMS_OUTPUT.PUT_LINE(l_script_name || '- Checking if '||l_tbs_name||' tablespace exists');
    
    BEGIN
		SELECT COUNT(tablespace_name) 
		  INTO l_tbs_exists 
		  FROM dba_tablespaces 
		 WHERE tablespace_name = l_tbs_name;  
	EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE(l_script_name || ' SELECT - exception');
			RAISE;
    END;
   
   DBMS_OUTPUT.PUT_LINE('Dropping tablespace: '||l_tbs_name);
    l_sql:='DROP TABLESPACE '||l_tbs_name||' INCLUDING CONTENTS AND DATAFILES CASCADE CONSTRAINTS';
    
    DBMS_OUTPUT.PUT_LINE('Script to drop tablespace: '||l_sql);
    EXECUTE IMMEDIATE l_sql;
END;
/ 

PROMPT
PROMPT Script end: drop_tablespace.sql
PROMPT
