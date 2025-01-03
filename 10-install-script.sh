#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
then 
   echo "ERROR:: you must have sudo acess to execute this script"
   exit 1 #other than 0
fi

dnf install mysql -y 

if [ $? -ne 0 ]
then
   echo "Installing Mysql...FAILURE"
   exit 1
else
    echo "Install Mysql ... SUCCESS"
    fi

    dnf install git -y
    
    if [$? -ne 0]
    then
    echo "Installiing Git ... FAILURE"
    exit 1
else 
    echo "Installing Git ... SUCCESS"
    fi
    