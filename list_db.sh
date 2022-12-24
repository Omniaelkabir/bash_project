#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex
cd $name
read -p "Enter your Database name: " database_name   #enter database name and checking for spaces, numbers and special
database_name_number
database_name_space
while [ -z $database_name  ]  #database name can not be empty
do
            echo "Empty Value Please inter vaild input"
            read -p "Enter DataBase Name Again " database_name
            database_name_number
            database_name_space
done

if [  -e $database_name  ];then  #starting listing all information about database

                        echo "All tables in Our Database"
                        ls -R $database_name 
                        echo "You Finshed"
                        


else
    echo "Can not find DataBase"
    read -p "Enter your Database name Again: " database_name
    database_name_number
    database_name_space 

fi