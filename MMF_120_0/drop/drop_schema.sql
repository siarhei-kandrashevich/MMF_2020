PROMPT
PROMPT Script start: drop_schema.sql
PROMPT

PROMPT Script info:
select sys_context('USERENV', 'MODULE') from dual; 
PROMPT

DECLARE
    l_schema_exists   NUMBER(1);
    l_sql          VARCHAR2(4000);
    l_schema_name     VARCHAR2(500) := '&&1';
	l_script_name  VARCHAR2(50) := 'drop_schema.sql';
BEGIN
    DBMS_OUTPUT.PUT_LINE(l_script_name || '- Iput parameter Schema Name = '||l_schema_name);
    DBMS_OUTPUT.PUT_LINE(l_script_name || '- Checking if '||l_schema_name||' schema exists');
    
    BEGIN
		SELECT COUNT(username) 
		  INTO l_schema_exists 
		  FROM dba_users
		 WHERE username = l_schema_name;  
	EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE(l_script_name || ' SELECT - exception');
			RAISE;
    END;
    
    DBMS_OUTPUT.PUT_LINE('Dropping schema: '||l_schema_name);
    l_sql:='DROP USER '||l_schema_name;
    
    DBMS_OUTPUT.PUT_LINE('Script to drop schema: '||l_sql);
    EXECUTE IMMEDIATE l_sql;
END;
/ 

PROMPT
PROMPT Script end: drop_schema.sql
PROMPT