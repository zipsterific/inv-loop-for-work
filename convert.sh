#!/bin/bash

FILE="$1"

for line in `cat $FILE`
do
  DEVICE=`echo $line | cut -d "," -f 1`
  IP=`host $DEVICE | grep "has address" | cut -d " " -f 4`
  echo $line | grep "^[0-9]" 
   if [ $? -eq 0 ]
    then
    echo "exiting..."
    exit 0
   else
    sed -i "s/$DEVICE/$IP/g" $FILE
   fi
done
