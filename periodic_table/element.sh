#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

echo "Please provide an element as an argument."

if [[ $1 =~ ^[0-9]+$ ]]
then
  # atomic number
  ELEMENT_DATA=$($PSQL "select * from elements where atomic_number = $1")
  echo $ELEMENT_DATA
else
  # element name
  ELEMENT_DATA=$($PSQL "select * from elements where name ilike '$1%' limit 1")
  echo $ELEMENT_DATA
fi
