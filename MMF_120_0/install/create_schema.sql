PROMPT *******************************
PROMPT Script start: create_schema.sql
PROMPT *******************************

PROMPT Script info:
select sys_context('USERENV', 'MODULE') from dual; 
PROMPT

SET SERVEROUTPUT ON

define SCHEMA_NAME = &&1
define SCHEMA_PASSWORD = &&2
define DEFAULT_TBS = &&3
define INDEX_TBS = &&4  

CREATE USER &&SCHEMA_NAME
IDENTIFIED BY &&SCHEMA_PASSWORD
DEFAULT TABLESPACE &&DEFAULT_TBS
TEMPORARY TABLESPACE temp;

ALTER USER &&SCHEMA_NAME QUOTA UNLIMITED ON &&DEFAULT_TBS ; 
ALTER USER &&SCHEMA_NAME QUOTA UNLIMITED ON &&INDEX_TBS ; 

undefine SCHEMA_NAME 
undefine SCHEMA_PASSWORD
undefine DEFAULT_TBS
undefine INDEX_TBS

PROMPT *******************************
PROMPT Script end: create_schema.sql
PROMPT *******************************