#!/bin/bash

NDATE=` date --date='next sun' +%Y%m%d`
PDATE=` date --date='last sun' +%Y%m%d`

N_DATE = ` date --date='next sun' +%Y-%m-%d`

USERNAME = ""
PASSWORD = ""
DB = ""
TABLE_NAME = ""

mysql -u$USERNAME -p$PASSWORD $DB -e "ALTER TABLE $TABLE_NAME DROP PARTITION from$PDATE"

mysql -u$USERNAME -p$PASSWORD $DB -e "ALTER TABLE $TABLE_NAME \
                REORGANIZE PARTITION future INTO ( \
                PARTITION from$NDATE VALUES LESS THAN (TO_DAYS('$N_DATE')), \
                PARTITION future     VALUES LESS THAN MAXVALUE) "