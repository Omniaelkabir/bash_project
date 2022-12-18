#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex

read -p "Enter Table Name to Create " database_name
cd $name
while [ -z $database_name  ]
do
            echo "Empty Value Please inter vaild input"
            read database_name
done

while [[ $name =~ ^[+-]?[0-9]+\.?[0-9]* ]];do

    echo "Can not start with numbers " 
    read -p "Enter DataBase Name Again" database_name
done

case "$database_name" in  
     *\ * )
           
           database_name="${database_name// /_}"
        #    echo $database_name
          ;;
esac

while [  -e $table_name  ]
 do
    echo "DB with the name $database_name already exists"
    # cat $database_name
    read -p "Enter table name again" database_name
  done 


if [[  $database_name!=$database_name  ]];then
    echo "Starting Creating Database " 
    mkdir $database_name
    echo "Successfully Added DataBase"

fi
