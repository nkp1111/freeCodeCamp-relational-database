#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(( $RANDOM % 1000 + 1 ))

echo "Enter your username:"
read USERNAME

GAME_PLAYED=0
BEST_GAME=0

USER_DATA=$($PSQL "SELECT * FROM number_guess WHERE username = '$USERNAME'")

# check if user exist
if [[ -z $USER_DATA ]]
then
  # if no user exist
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # if user exist
  echo $USER_DATA | while IFS="|" read ID USERNAME GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    BEST_GAME=$BEST_GAME
    GAMES_PLAYED=$GAMES_PLAYED
  done
fi

# game start
echo "Guess the secret number between 1 and 1000:"
read GUESS
echo "$RANDOM_NUMBER"
NUMBER_OF_GUESS=1

# until guess is right
until [[ $GUESS == $RANDOM_NUMBER ]]
do
  # increase guess count
  (( NUMBER_OF_GUESS++ ))
  # if guess is not integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    # if guess is lower
    if (( $GUESS > $RANDOM_NUMBER ))
    then
      echo "It's lower than that, guess again:"
    # if guess is higher
    elif (( $GUESS < $RANDOM_NUMBER ))
    then
      echo "It's higher than that, guess again:"  
    fi
  fi
  # ask for guess
  read GUESS
done

(( GAME_PLAYED++ ))
if [[ $BEST_GAME != 0 ]]
then
  if [[ $BEST_GAME > $NUMBER_OF_GUESS ]]
  then
    BEST_GAME=$NUMBER_OF_GUESS
  fi
else
  BEST_GAME=$NUMBER_OF_GUESS
fi

# if guess is correct
if [[ $GUESS == $RANDOM_NUMBER ]]
then
  INSERT_USER_RESULT=$($PSQL "INSERT INTO number_guess (username, games_played, best_game) VALUES ('$USERNAME', $GAME_PLAYED, $BEST_GAME)")
  echo "You guessed it in $NUMBER_OF_GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"
fi
