#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex
#echo $name
cd $name
read -p "Enter DataBase Name to Drop " database_name
database_name=${database_name,,}
database_name_number
database_name_space
while [ -z $database_name ]
    do
            echo "Empty Value Please inter vaild input"
            read -p "Enter DataBase Name Again" database_name
            database_name=${database_name,,}
            database_name_number
            database_name_space
done

while [[ -f $database_name ]];do
    echo "Can't Remove File Please Enter Right Directory"
    read -p "Enter DataBase Name Again" database_name
    database_name=${database_name,,}
    database_name_number
    database_name_space
done

if [ -e $database_name ];then
echo "Are you sure you want to delete "$database_name
select choice in "Yes" "No"
do
case $choice in 

    "Yes")
    echo "Starting Remove DataBase"
    rm -r $database_name
    echo "Database Successfully Deleted"
    break;
    ;;

    "No")
    echo "Exit"
    break;
esac    
done
    
    else 
    echo "Can't Find DataBase Folder"
    fi

echo "return main menu"
     cd - 
     chmod 775 ./project_menu.sh
     echo "you enter main menu"
     ./project_menu.sh

    