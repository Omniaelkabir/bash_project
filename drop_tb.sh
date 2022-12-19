#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex

read -p "Enter Table Name to Drop " table_name
while [ -z $table_name ]
    do
            echo "Empty Value Please enter vaild input"
            read -p "Pealse enter Table Name Again" table_name
            table_name_number
            table_name_space
    done


while [[ -d $table_name ]];do
    echo "Can't Remove Folder Please Enter Right File"
    read -p "Pealse enter Table Name Again" table_name
    table_name_number
    table_name_space
done    
if [ -e $table_name ];then
    echo "Are you sure you want to delete: \"$table_name\""
    select choice in 'yes' 'no'
        do 
            case $choice in
                'yes') 
                    echo "Starting Remove Table"
                    rm -r $table_name
                    echo "Table \"$table_name\" is deleted Successfully"
                    break;
                ;;
                'no') 
                    echo "Exit"
                    break;
                    ;;
                *) 
                    echo "Choose Valid Option" ;;
            esac
        done

else 
    echo "Can't Find Table "

fi
