#!/bin/bash

ping -c 1 $3 >> /dev/null

if [[ $? -eq 0 ]]
then
	sshpass -p $2 scp /etc/passwd $1@$3:/home/$1/ && echo -e "\e[32muccessful\e[0m"
else
	echo "Your Ip Unreachable!! "
fi

