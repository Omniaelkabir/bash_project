#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex

read -p "Enter Table Name to Create " database_name
database_name_number
database_name_space
cd $name

while [ -z $database_name  ]
do
            echo "Empty Value Please inter vaild input"
            read -p "Enter DataBase Name Again " database_name
            database_name_number
            database_name_space
done

while [  -e $database_name  ]
 do
    echo "DB with the name $database_name already exists"
    # cat $database_name
    read -p "Enter Database name again " database_name
    database_name_number
    database_name_space
    
  done 


if [[  $database_name!=$database_name  ]];then
    database_name_number
    database_name_space
    echo "Starting Creating Database " 
    mkdir $database_name
    echo "Successfully Added DataBase"

fi
