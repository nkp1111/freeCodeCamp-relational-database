#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
QUERY="SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USiNG(type_id)"

# if not argument
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # if argument is number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # atomic_number
    PROPERTY=$($PSQL "$QUERY WHERE atomic_number = $1")

    # if no property
    if [[ -z $PROPERTY ]]
    then
      echo "I could not find that element in the database." 
    else
      # display property
      echo $PROPERTY | while IFS="|" read TYPE_ID ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT BOILING_POINT SYMBOL NAME TYPE
      do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done
    fi

  else
    # element name
    PROPERTY=$($PSQL "$QUERY WHERE name ILIKE '$1%' LIMIT 1")

    # if no property
    if [[ -z $PROPERTY ]]
    then
      echo "I could not find that element in the database."
    else
      # display property
      echo $PROPERTY | while IFS="|" read TYPE_ID ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT BOILING_POINT SYMBOL NAME TYPE
      do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done
    fi
  fi
fi
