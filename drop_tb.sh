#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex

read -p "Enter Table Name to Drop " table_name   #read table name and check from spaces numbers and special
             table_name=${table_name,,}
            table_name_number
            table_name_space
while [ -z $table_name ]     #check if table name is empty
    do
            echo "Empty Value Please enter vaild input"
            read -p "Pealse enter Table Name Again" table_name
             table_name=${table_name,,}
            table_name_number
            table_name_space
    done


while [[ -d $table_name ]];do   #table is file so i can not enter directory
    echo "Can't Remove Folder Please Enter Right File"
    read -p "Pealse enter Table Name Again" table_name
     table_name=${table_name,,}
    table_name_number
    table_name_space
done    
if [ -e $table_name ];then   #can not create two file with same name
    echo "Are you sure you want to delete: \"$table_name\""
    select choice in 'yes' 'no'   #menu to ask user if he/she was sure from droping table
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
    read -p "Pealse enter Table Name Again" table_name
     table_name=${table_name,,}
    table_name_number
    table_name_space

fi

echo "Do you want to return to table menu or main menu?"
cd ../..
select opt in Table_Menu Main_Menu 
do 
     case $opt in 
     "Table_Menu" )
     chmod 775 ./connect_db.sh  
       echo "Select Database to connect first"
     ./connect_db.sh;;
     "Main_Menu")
     chmod 775 ./project_menu.sh
     echo "you enter main menu"
     ./project_menu.sh;;
     * )
     echo "enter vaild option"
esac
done

