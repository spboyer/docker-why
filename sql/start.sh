#!/bin/bash
wait_time=20s

echo creating resources in $wait_time
sleep $wait_time
echo starting...

echo 'creating Names DB'
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -i ./init.sql

echo 'creating Names Table'
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -i ./data/NameTable.sql

echo 'importing data...'
/opt/mssql-tools/bin/bcp Names in data/Names.csv -S 0.0.0.0 -U sa -P $SA_PASSWORD -d Names -c -t ','

echo 'add uniqueid column'
/opt/mssql-tools/bin/sqlcmd -S localhost -d Names -U SA -P $SA_PASSWORD -I -Q "ALTER TABLE Names ADD ID UniqueIdentifier DEFAULT newid() NOT NULL;"

echo 'checking data'
/opt/mssql-tools/bin/sqlcmd -S localhost -d Names -U SA -P $SA_PASSWORD -I -Q "SELECT TOP 5 ID,FullName FROM Names;"