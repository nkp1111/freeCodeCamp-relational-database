#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # atomic_number
    PROPERTY=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number = $1")

    echo $PROPERTY | while IFS="|" read ATOMIC_NUMBER TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE_ID SYMBOL NAME
    do
      echo $ATOMIC_NUMBER $NAME
    done
  else
    # element name
    VAL=$($PSQL "SELECT * FROM properties INNER JOIN elements WHERE name ILIKE '$1%' LIMIT 1")
    echo $PROPERTY | while IFS="|" read ATOMIC_NUMBER TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE_ID SYMBOL NAME
    do
      echo $ATOMIC_NUMBER $NAME
    done
  fi
fi
