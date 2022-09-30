#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # atomic_number
    VALUE=$($PSQL "select * from elements where atomic_number = $1")
    echo $VALUE
  else
    # element name
    VAL=$($PSQL "select * from elements where name ilike '$1%' limit 1")
    echo $VAL
  fi
fi
