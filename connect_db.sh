#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex
cd $name
read -p "Enter DataBase Name to Connect " database_name
while [ -z $database_name ]
    do
        echo "Empty Value Please inter vaild input"
        read -p "Pealse enter DataBase Name Again" database_name
        database_name_number
        database_name_space

    done

while [[ -f $database_name ]];do
    echo "Can't Connect File Please Enter Right Directory "
    read -p "Pealse enter DataBase Name Again" database_name
    database_name_number
    database_name_space
done    
if [ -e $database_name ];then
    echo "Starting Connect DataBase "
export $database_name
    cd $database_name
    select opt in List_DB Create_Table List_Table Drop_Table Insert_Table Select_from_Table Delete_from_Table Update_Table 
        do
        case $opt in 
        "List_DB" )
        chmod 775 ../.././list_db.sh
        ../.././list_db.sh ;;
        "Create_Table" )
        chmod 775 ../.././create_tb.sh
         ../.././create_tb.sh;;
        "List_Table" )
        chmod 775  ../.././list_tb.sh
         ../.././list_tb.sh ;;
        "Drop_Table" )
        chmod 775 ../.././drop_tb.sh
         ../.././drop_tb.sh;;
        "Insert_Table" )
        chmod 775 ../.././insert_tb.sh
        ../.././insert_tb.sh;;
        "Select_from_Table" )
        chmod 775 ./select_from_tb.sh
        echo ./select_from_tb.sh;;
        "Delete_from_Table" )
        chmod 775 ./delete_from_tb.sh
        echo ./delete_from_tb.sh ;;
        "Update_Table" )
        chmod 775 ./update_tb.sh
        echo ./update_tb.sh
        esac
        done
    else 
    echo "Can't Find DataBase"
    fi
    
    