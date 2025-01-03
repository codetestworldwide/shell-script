#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
then 
   echo "ERROR:: you must have sudo acess to execute this script"
   exit 1 #other than 0
fi

 dnf list installed mysql

 if [ $? -ne 0] 
  then # not installed
 dnf install mysql -y
if [ $? -ne 0 ]
then
     echo "Installing Mysql...FAILURE"
     exit 1
else
    echo "Install Mysql ... SUCCESS"
    
    fi
    
else
    echo "MYSQL is already ... INSTALLED"
fi
# if [$? -ne 0]
#then 
#echo "Installiing Git ... FAILURE"
    #exit 1
#else 
# echo "Installing Git ... SUCCESS"
   # fi
dnf install git
   
   if [$? -ne 0]
   then
   dnf install got -y
if [$? -ne 0]
then
echo "Installling Git ... FAILURE"
exit 1
else
  echo "INSTALLING Git ... SUCCESS"
fi
else
  echo "Git is already ... INSTALLED"
  fi


#if [$? -ne 0]
#then
# echo "INSTALLING Git ... FAILURE"
#exit
#else
#echo "INSTALLING Git ... SUCCES"
#fi




    