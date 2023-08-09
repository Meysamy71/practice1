#!/bin/bash

clear

ReadNum()
{
while [ -z $NUM ]
do
read -p "Please enter a number: " NUM
done
}

ReadNum

NUM=`echo $NUM |tr -d [:alpha:]|tr -d [:punct:]`

if [[ "$NUM" =~ ^[0-9]+$ ]]
then
	

	if [ $NUM -gt 10 ]
	then
		echo -e "\e[32mYour Number $NUM greate than 10----> $NUM > 10\e[0m"
	elif [ $NUM -lt 10 ]
	then
		echo -e "\e[31mYour Number $NUM less than 10 ----> $NUM < 10\e[0m"
	else
		echo "Your Number $NUM equal 10 ----> $NUM = 10"
	fi
else
	echo "Your number is wrong please tyr agin"
	ReadNum
fi
