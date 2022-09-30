#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$RANDOM

echo "Enter your username:"
read USERNAME

USER_DATA=$($PSQL "SELECT * FROM number_guess WHERE username = '$USERNAME'")
echo $USER_DATA 

# check if user exist
if [[ -z $USER_DATA ]]
then
  # if no user exist
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # if user exist
  echo "Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses."
fi
