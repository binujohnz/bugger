#!/usr/bin/ksh

cd `dirname $0`
typeset BIN_DIR=`pwd`

typeset DB_FILE="$BIN_DIR/../data/MYDB.dat"

$BIN_DIR/../../../sqlite/sqlite3 -echo $DB_FILE < $BIN_DIR/tables.sql
