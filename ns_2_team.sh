#!/bin/bash

PSQL_USER="cmpt355_"$USER
CSV_FOLDER=~/"csv_355"

SQL_CMD=""

if [ ! -d "$CSV_FOLDER" ]; then
  mkdir $CSV_FOLDER
fi

tables=("Parties" "Works" "Locations" "Exhibitions" "WorksValues" "WorksMedia" "WorksOwners" "Doors" "WorksLocations" "ExhibitionLocations" "ExhibitionStaff" "ExhibitionSponsor" "ExhibitionWorks" "Transactions" "WorksFlightMethod" "WorksPlaneUsage")
for tbl in "${tables[@]}"
do
	touch $CSV_FOLDER/$USER'_'$tbl'.txt'
	CPY_CMD="\copy ns_$tbl TO "$CSV_FOLDER"/"$USER"_$tbl.txt ;"
	SQL_CMD=$SQL_CMD$'\n'$CPY_CMD
done

echo "Please enter your database password:"
echo "$SQL_CMD" | psql -h db.cs.usask.ca -U $PSQL_USER $PSQL_USER


SQL_CMD=''
for tbl in "${tables[@]}"
do
	CPY_CMD="\copy $tbl FROM "$CSV_FOLDER"/"$USER"_$tbl.txt ;"
	SQL_CMD=$SQL_CMD$'\n'$CPY_CMD
done

# Team Password
export PGPASSWORD='zrEWol7YuU6z7WFNsLrE'
echo "$SQL_CMD" | psql -h edjo.usask.ca -U cmpt355_team10 cmpt355_team10
