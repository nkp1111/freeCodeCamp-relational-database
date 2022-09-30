#!/bin/bash

PSQL="psql -username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$RANDOM

echo "Enter your username:"
read USER_NAME
