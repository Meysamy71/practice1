#!/bin/bash

clear


for ((i=1;i<=20;i++))
do
        read -p "Please enter $i Number : " NUM

        SUM=$[$SUM+$NUM]

        if [[ $i -eq 1 ]]
        then
                MAX=$NUM
                MIN=$NUM
        else
                if [[ $NUM -gt $MAX ]]
                then
                        MAX=$NUM
                elif [[ $NUM -lt $MIN ]]
                then
                        MIN=$NUM
                fi
        fi
done

AVG=$[SUM/20]

echo "The Sum is: $SUM "
echo "The Avrage is: $AVG "
echo "The Max is: $MAX "
echo "The Min is: $MIN "
