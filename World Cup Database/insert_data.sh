#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "truncate table games, teams")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # winner and opponent are teams
  # teams table
  if [[ $WINNER != winner ]]
  then 
    # get winner id 
    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    # if no winner id
    if [[ -z $WINNER_ID ]] 
    then
      # insert winner into team table
      INSERT_WINNER_RESULT=$($PSQL "insert into teams (name) values ('$WINNER')")
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted winner $WINNER
      fi
    fi
    # get new winner id
    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")

    # get opponent id
    OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")    
    # if no opponent id
    if [[ -z $OPPONENT_ID ]]
    then
      # insert opponent into team table 
      INSERT_OPPONENT_RESULT=$($PSQL "insert into teams (name) values ('$OPPONENT')")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted opponent $OPPONENT
      fi
    fi
    # get new opponent id
    OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")

    # games table
    # insert games
    INSERT_GAME_RESULT=$($PSQL "insert into games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) values ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    echo Inserted game $WINNER vs $OPPONENT, $YEAR
  fi  
done
