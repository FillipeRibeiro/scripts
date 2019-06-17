#!/bin/sh

# File created to save query results into a file
# using an easy configurable variable to search in a database
# and making a query wished

echo "Digite o host do banco"
read HOST_IP

echo "Digite o nome do schema"
read DB_NAME

echo "Digite o caminho do arquivo que salvará o resultado:"
read FILE_PATH

echo "Digite sua query"
read QUERY

# ENV
#HOST_IP=localhost
#DB_NAME="db_testing"
#FILE_PATH=/home/fillipe/notas.txt
#QUERY="select * from users;"
QUERY_STRING="use $DB_NAME; $QUERY"

if [ -e $FILE_PATH ]
then 
    chmod -R 777 $FILE_PATH
else 
    touch $FILE_PATH && chmod -R 777 $FILE_PATH
fi

# Store the query results to file passed
mysql -u root -p -h "$HOST_IP" -e "$QUERY_STRING" > $FILE_PATH
