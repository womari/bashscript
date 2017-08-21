#!/bin/bash


#This script will get you some basic info about the system at first, then you can search for a file in the system (if found you will get some info about it and timestamps) also you can search for a specific user and get his info and last 10 activities 

#here is a function that will display some info about the system


#for presentation purposes
bold=$(tput bold)
normal=$(tput sgr0)

read -p "Your name, please " name
info(){

#for presentation purposes
bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}Hello $name here are some basic info about the system!Then you can search for file and or a user in the system ${normal}Enjoy"



#system info 
echo "${bold}Here are some basic info about the system  ${normal}"
info1=$(uname -o)
info2=$(uname -v)
info3=$(uname -s)
echo "${bold}the oprating system is${normal}: $info1"
echo "${bold}the kernal version  is${normal}: $info2"
echo "${bold}the kernal release  is${normal}: $info3"



#ip addr 
myIP=$(ip addr)

echo "${bold}IP address details${normal}: $myIP"

#open network connections 
echo "${bold}Listening and open network connections  ${normal} $netmapp"
netmap= netstat --inet -a 2>/dev/null

#Ram 
freeram=$(free -m)
echo "${bold}The free and total amount of RAM${normal}: $freeram"
}

info 






echo "${bold}Looking for something specific ?this will search for a file name in the system then a user name${normal}"

checkfiles(){
filename=""
while [ -z $filename ]; do
    echo "${bold}Please enter the file name:${normal} "
    read filename
done

# checking if file exists then printing its info and timestamps
if [ -f "$filename" ];then
  echo "YES! the file exist"
  filepath=$(find $PWD -type f -name "$filename")
  filestat=$(stat $filename)
  filetype=$(file $filename)
  echo "${bold}The current path of the file is${normal} :$filepath"
  echo "${bold}The file type is ${normal} :$filetype"
  echo "${bold}The file details and filestamps ${normal}:$filestat"

else
  echo "SORRY! this file does not exist"
fi
}
checkusers(){

#this will check if the user exists and will print the user id and last logins 
username=""
while [ -z $username ]; do
    echo "${bold}Please the user name ${normal} "
    read username
done

# checking if user exists if yes it will display the uid and last ten acitivites 
if id -u $username 2>/dev/null; then
  echo "YES! the user exist" 
	infous=$(id -a $username) 
	lastact=$(last tail -10 $username) 
	echo "${bold}Here are some info about the user you are looking for${normal}: $infous"
	echo "${bold}Here are the last activities done by the user${normal} : $lastact"


else
  echo "SORRY! this user does not exist"
fi
}

checkfiles
checkusers


