#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
then 
   echo "ERROR:: you must have sudo acess to execute this script"
fi

dnf install mysql -y 