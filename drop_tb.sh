#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex

read -p "Enter Table Name to Drop " table_name
while [ -z $table_name ]
    do
            echo "Empty Value Please enter vaild input"
            read $table_name
    done
while [[ $table_name =~ ^[+-]?[0-9]+\.?[0-9]* ]];do

    echo "Can not start with numbers " 
    read -p "Enter Table Name Again" table_name
done
case "$table_name" in  
     *\ * )
           
           table_name="${table_name// /_}"
        #    echo $table_name
          ;;
esac    
while [[ -d $table_name ]];do
    echo "Can't Remove Folder Please Enter Right File"
    read -p "Pealse enter Table Name Again" table_name
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
