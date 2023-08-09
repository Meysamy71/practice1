#!/bin/bash

clear

echo "Please enter 2 number and display number between"

read -p "Please enter first number: " NUM1

read -p "Please enter second number: " NUM2

echo -e "\n"
if [[ $NUM1 -lt $NUM2 ]]
then
    for ((i=$NUM1;i<=$NUM2;i++))
    do
        echo -n "$i "
    done

    echo -e "\n"
else
    for ((i=$NUM2;i<=$NUM1;i++))
    do
        echo -n "$i "
    done

   echo -e "\n"
fi