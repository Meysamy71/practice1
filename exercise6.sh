#!/bin/bash

clear

TODAY=`date +%Y/%m/%d`
DAY=`date +%A`
HOST=`hostname`
OS=`uname`
DISTRO=`hostnamectl |grep "Operating"|cut -f 2 -d ":"|sed 's/ //'`
USERS_LOGIN_C=`w -h|wc -l`

echo -e "Hello dear \e[31m$USER\e[0m wellcome to \e[31m$HOST\e[0m machine"
echo -e "Today is \e[31m$DAY $TODAY\e[0m and you use to \e[31m$OS\e[0m OS and \e[31m$DISTRO\e[0m distro"
echo -e "Now \e[31m$USERS_LOGIN_C\e[0m number is login"
echo -e "Bye!"
