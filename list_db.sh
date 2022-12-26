#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex
cd $name
read -p "Enter your Database name: " database_name   #enter database name and checking for spaces, numbers and special
database_name=${database_name,,}  #to make database name lower case
database_name_number
database_name_space
while [ true ];do
if [ -z $database_name  ];then  #database name can not be empty

            echo "Empty Value Please inter vaild input"
            read -p "Enter DataBase Name Again " database_name
          database_name=${database_name,,}
            database_name_number
            database_name_space


elif [  -e $database_name  ];then  #starting listing all information about database

                        echo "All tables in Our Database"
                        ls -R $database_name 
                        echo "You Finshed"
                        break
                        


else
    echo "Can not find DataBase"
    read -p "Enter your Database name Again: " database_name
     database_name=${database_name,,}
    database_name_number
    database_name_space 

fi
done
echo "return main menu"
     cd - 
     chmod 775 ./project_menu.sh
     echo "you enter main menu"
     ./project_menu.sh
