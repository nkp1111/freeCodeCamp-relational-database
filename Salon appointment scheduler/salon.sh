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
    MAIN_MENU "I could not find that service. What would you like today?"
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

    # get service name
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    
    # get service time
    echo "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME   

    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name = '$CUSTOMER_NAME'")
    # insert appointment
    INSERT_INTO_APPOINTMENT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ('$CUSTOMER_ID', $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    
    if [[ $INSERT_INTO_APPOINTMENT == 'INSERT 0 1' ]]
    then
      # send to main menu
      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
      EXIT
    fi
  fi
}

EXIT(){
  echo -e "\nThank you for visiting. Please come again.\n"
}

MAIN_MENU

