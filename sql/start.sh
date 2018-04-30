#!/bin/bash
wait_time=15s

echo creating resources in $wait_time
sleep $wait_time
echo starting...

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -i ./init.sql

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -i ./data/MyTable.sql
