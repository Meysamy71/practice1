#!/bin/bash

LOG_DATE=`date +%Y.%m.%d`
LOG_TIME=`date +%Y.%m.%d.%H:%M:%S`


FILE=list.txt

while IFS=" " read -r f1 f2 f3
do
	ping -c 1 $f1 >> /dev/null

	if [[ $? -eq 0 ]]
	then
		echo "The $f1:$f2 in $f3 at $LOG_TIME is:Reachable" >> ip.$LOG_DATE.log
	else
		echo "The $f1:$f2 in $f3 at $LOG_TIME is:Unreachable" >>  ip.$LOG_DATE.log
	fi

done <"$FILE"
