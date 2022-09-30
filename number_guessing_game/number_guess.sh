#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(( $RANDOM % 1000 + 1 ))

echo "Enter your username:"
read USERNAME

USER_DATA=$($PSQL "SELECT * FROM number_guess WHERE username = '$USERNAME'")

# check if user exist
if [[ -z $USER_DATA  ]]
then
  # if no user exist
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # if user exist
  echo $USER_DATA | while IFS="|" read ID USERNAME GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

# game start
echo "Guess the secret number between 1 and 1000:"
read GUESS
# until guess is right
until [[ $GUESS == $RANDOM_NUMBER ]]
do
  # if guess is not integer
  
  # if guess is higher
  # if guess is lower
  # ask for guess
  read GUESS
  # if guess is correct
done
