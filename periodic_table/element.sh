#!/bin/bash

echo "Please provide an element as an argument."

if [[ $1 =~ ^[0-9]+$ ]]
then
  echo "It is atomic_number"
else
  echo "It is name"
fi
