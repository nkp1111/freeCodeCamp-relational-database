#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo -e "\n~~~~~ NKP1111 SALON ~~~~~\n"

MAIN_MENU(){

  if [[ $1 ]]
  then 
    echo $1
  fi

  echo -e "\nWelcome to nkp1111 salon, How can i help you"
  SERVICES
}

SERVICES(){
  # get services
  SERVICES=$($PSQL "SELECT service_id, name FROM services")

  # display services
  echo "$SERVICES" | while IFS="|" read SERVICE_ID SERVICE_NAME
  do 
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  # ask for service id 
  echo -e "\nWhich service would you like to book:"
  read SERVICE_ID_SELECTED

  # if not service id
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # send to main menu
    MAIN_MENU "Please provide a proper service_id from the list"
  else
    # book appointment for the service
    # get customer info
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    # check if customer exist
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    
    # if not exist 
    if [[ -z $CUSTOMER_NAME ]]
    then
      # create new customer
      echo "I don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      # insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
      # if [[ $INSERT_CUSTOMER_RESULT == 'INSERT 0 1' ]]
      # then
      #   echo "$CUSTOMER_NAME"
      # fi
    fi

    echo "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME   
  fi

}

# APPOINTMENT(){


   
# }

MAIN_MENU

