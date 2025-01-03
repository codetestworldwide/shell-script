!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FILDER="var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
       echo "$2 ... $R FAILURE"
       exit 1
  else
       echo "$2 ... $G SUCCESS"
  fi
}    
 
echo "script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID  -ne 0 ]
then
    echo "ERROR:: you must have sudo access to execute this script"
    exit 1 #other than 0
fi

dnf list installed mysql &>>$LOG_FILE_NAME

if [ $? -ne 0 ] 
then # not installed
   dnf install mysql -y &>>$LOG_FILE_NAME
   VALIDATE $? "Installing Mysql"
else
   echo -e "Mysql is already ...$Y INSTALLED"
fi


dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
     dnf install git -y &>>$LOG_FILE_NAME
     VALIDATE $?"Installing Git"
else
    echo "Git is already ... $Y INSTALLED"
fi
    









    