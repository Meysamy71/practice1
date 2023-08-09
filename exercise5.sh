#!/bin/bash

LOG_DATE=`date +%Y.%m.%d`
MYPATH=/tmp/passwdbk

if [[ -d $MYPATH ]]
then
	cat /etc/passwd|cut -f1,3 -d ":" > $MYPATH/passwd.$LOG_DATE.log
else
	mkdir $MYPATH
	cat /etc/passwd|cut -f1,3 -d ":" > $MYPATH/passwd.$LOG_DATE.log
fi

find $MYPATH -name passwd.*.log -mtime 2 -exec rm -rf {} \;

