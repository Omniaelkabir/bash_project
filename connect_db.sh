#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex
echo $name
read -p "Enter DataBase Name to Connect " database_name

    while [ -z $database_name ]
    do
            echo "Empty Value Please inter vaild input"
            read database_name
done
if [[ -f $database_name ]];then
    echo "Can't Connect File Please Enter Right Directory "
elif [ -e $name/$database_name ];then
    echo "Starting Connect DataBase "
export $database_name
    cd $name/$database_name
    select opt in List_DB Create_Table List_Table Drop_Table 
        do
        case $opt in 
        "List_DB" )
        echo ./list_db.sh ;;
        "Create_Table" )
        chmod 775 ../.././create_tb.sh
         ../.././create_tb.sh;;
        "List_Table" )
        chmod 775 ./list_tb.sh
        echo ./list_tb.sh;;
        "Drop_Table" )
        chmod 775 ../.././drop_tb.sh
         ../.././drop_tb.sh;;
        esac
        done
    else 
    echo "Can't Find DataBase"
    fi
    
    