#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo -e "\n~~~~~ NKP1111 SALON ~~~~~\n"

MAIN_MENU(){

  if [[ $1 ]]
  then 
    echo $1
  fi

  echo "Welcome to nkp1111 salon, How can i help you"

  SERVICES
}

SERVICES(){
  # get services
  SERVICES=$($PSQL "SELECT * FROM services")
  # display services
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE
  do 
    echo $SERVICE_ID 
  done
  # ask for service id 
  # if not service id
  # send to main menu
  # book appointment for the service
}

MAIN_MENU

