-- This file is main file to upgrade schema.
-- This file should be run under SYSTEM user.
--
-- Input: 1 - User name
-- Example of run: SQL> @main.sql MMF_120_0

SET TIME ON
SET TIMING ON
SPOOL UPGRADE_SCHEMA.LOG

DEFINE USER_NAME = &&1

SET SERVEROUTPUT ON
PROMPT Username to upgrade: &&USER_NAME

connect &&USER_NAME/oracle 
-- Run our scripts

SET SERVEROUTPUT OFF

UNDEFINE USER_NAME

SPOOL OFF