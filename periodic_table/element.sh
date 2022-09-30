#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

echo "Please provide an element as an argument."

if [[ $1 =~ ^[0-9]+$ ]]
then
  # atomic number
else
  # element name
fi
