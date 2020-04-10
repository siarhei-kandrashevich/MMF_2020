PROMPT
PROMPT Script start: create_table_person.sql
PROMPT

DEFINE TBS_NAME = &&1

SET SERVEROUTPUT ON

DECLARE 
    l_table_exists NUMBER(1);
	l_script_name  VARCHAR2(50) := 'create_table_person.sql';
    l_sql          VARCHAR2(4000);
    l_tbs_name     VARCHAR2(500) := '&&TBS_NAME';
BEGIN     
    DBMS_OUTPUT.PUT_LINE(l_script_name || '- Iput parameter TBS_NAME = '|| l_tbs_name);
    DBMS_OUTPUT.PUT_LINE(l_script_name || '- Checking if PERSON table exists');
    BEGIN
		SELECT COUNT(table_name) 
		  INTO v_table_exists 
		  FROM user_tables 
		 WHERE table_name = 'PERSON';  
	EXCEPTION
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE(l_script_name || ' SELECT - exception');
			RAISE;
    END;
	 
	IF v_table_exists = 0 THEN
		DBMS_OUTPUT.PUT_LINE(l_script_name || '- Create PERSON table.');
		
		DBMS_OUTPUT.PUT_LINE(l_script_name || '- Running the create table statement.');
              
        BEGIN
            l_sql := ' CREATE TABLE PERSON
			                   (ID NUMBER CONSTRAINT NN_PERSON_ID NOT NULL ENABLE,
                                FIRST_NAME VARCHAR2(50),
                                LAST_NAME VARCHAR2(50), 
                                CONSTRAINT PK_PERSON PRIMARY KEY (ID) ENABLE ) 
                                TABLESPACE :1)'
			EXECUTE IMMEDIATE l_sql USING l_tbs_name;
        EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(l_script_name || '- EXECUTE IMMEDIATE - exception');
                RAISE;
        END;
		
    ELSE	
		DBMS_OUTPUT.PUT_LINE(l_script_name || '- Table PERSON exists, NO ACTION');
	END IF; 
	
	DBMS_OUTPUT.PUT_LINE(l_script_name || '- End.');
	
EXCEPTION
	WHEN OTHERS THEN 
		DBMS_OUTPUT.PUT_LINE(l_script_name || '- Main exception.'); 
        RAISE;  
END;
/
  
PROMPT Adding comments on columns PERSON  Table ...

COMMENT ON COLUMN PERSON.ID IS 'Unique value which serves as the primary key.';
COMMENT ON TABLE  PERSON IS 'This table contains personal information';

UNDEFINE TBS_NAME 

PROMPT
PROMPT Script end: create_table_person.sql
PROMPT