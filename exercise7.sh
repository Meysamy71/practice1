#!/bin/bash



LOG_TIME=`date +%Y/%m/%d-%H:%M:%S`
LOG_DATE=`date +%Y.%m.%d`
LOG_NAME=ip.$LOG_DATE.log
LINE=`cat iplist.txt|wc -l`

for ((i=1;i<=$LINE;i++))
do
	SERVER_NAME=`head -n $i iplist.txt|tail -1|cut -f 2 -d " "`
	CITY=`head -n $i iplist.txt|tail -1|cut -f 3 -d " "`
	IP=`head -n $i iplist.txt|tail -1|egrep -o "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"`
	
	ping -c 1 $IP >> /dev/null
	if [[ $? -eq 0 ]]
	then
		echo -e "\e[32mReachable  |$SERVER_NAME|$IP|$CITY|$LOG_TIME|\e[0m" >> $LOG_NAME
	else
		echo -e "\e[31mUnreachable|$SERVER_NAME|$IP|$CITY|$LOG_TIME|<------\e[0m" >> $LOG_NAME
	fi
done

RESULT=`cat $LOG_NAME|cut -f 1 -d "|"|sort|uniq -c`
CITY_RESULT=`cat $LOG_NAME|grep "Un"|cut -f 4 -d "|"|sort|uniq -c`


echo "=================" >> $LOG_NAME
echo "Result: " >> $LOG_NAME
echo "$RESULT " >> $LOG_NAME
echo -e "\e[0m"
echo "=================" >> $LOG_NAME
echo "Unreachale server in city: "|tee -a  $LOG_NAME
echo "$CITY_RESULT"|tee -a $LOG_NAME
echo -e "\e[0m"

read -p "Do you want show server in city? y/n " REPLY
if [[ $REPLY = "y" ]]
then
	read -p "Please enter your city: " CITY_DETAIL
	echo "==========="
	head -n $LINE $LOG_NAME|grep "Un"|grep "$CITY_DETAIL"|cut -f 2,3,4 -d "|"
else
	exit
fi
echo -e "\e[0m"
