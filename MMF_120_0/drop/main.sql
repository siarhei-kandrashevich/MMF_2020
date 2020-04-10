-- This file is main file to drop schema.
-- This file should be run under SYSTEM user.
--
-- Input: 1 - User name
-- Example of run: SQL> @main.sql MMF_120_0

SET TIME ON
SET TIMING ON
SPOOL DROP_SCHEMA.LOG

DEFINE USER_NAME = &&1

SET SERVEROUTPUT ON
PROMPT Username to create: &&USER_NAME

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME

SPOOL OFF