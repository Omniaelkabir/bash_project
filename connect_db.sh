#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex
echo $name
read -p "Enter DataBase Name to Connect " input
if [[ -f $input ]];then
    echo "Can't Connect File Please Enter Right Directory "
elif [ -e $name/$input ];then
    echo "Starting Connect DataBase "
    cd $name/$input
    select opt in List_DB Create_Table List_Table Drop_Table 
        do
        case $opt in 
        "List_DB" )
        echo ./list_db.sh ;;
        "Create_Table" )
        chmod 775 ./create_tb.sh
        echo ./create_tb.sh ;;
        "List_Table" )
        chmod 775 ./list_tb.sh
        echo ./list_tb.sh;;
        "Drop_Table" )
        chmod 775 ./drop_tb.sh
        echo ./drop_tb.sh
        esac
        done
    else 
    echo "Can't Find DataBase"
    fi
    