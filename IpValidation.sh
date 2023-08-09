#!/bin/bash

clear

read -p "Please Enter Your Ip Address: " IP


IP=`echo $IP|tr -d [:alpha:]|tr -d [:blank:]`

DOTCHECK=`echo $IP|tr -d [:digit:]|tr -d [:space:]|wc -c`
if [[ $DOTCHECK -ne 3 ]]
then	
	echo "Wrong Ip Address check count [.] in your ip address"
fi

for ((i=1;i<=4;i++))
do
	ZEROCHECK=`echo $IP|cut -f $i -d "."`
	if [[ $i -eq 1 ]]
	then
		if [[ $ZEROCHECK -eq 0 ]]
		then
			echo "Wrong Ip octet $i cant 0"
		fi
	elif [[ $ZEROCHECK =~ ^0\d* ]]
	then
		echo "Your Ip Address Wrong in octec $i and $ZEROCHECK"
	fi

	IPCHECK=`echo $IP|cut -f $i -d "."`
	if [[ $IPCHECK -gt 255 ]] || [[ $IPCHECK -lt 0 ]]
	then
		echo "Wrong Ip Address in $i octet $IPCHECK"
	fi
done
