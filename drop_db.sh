#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex
#echo $name

read -p "Enter DataBase Name to Drop " database_name
    while [ -z $database_name ]
    do
            echo "Empty Value Please inter vaild input"
            read input
done
if [[ -f $database_name ]];then
    echo "Can't Remove File Please Enter Right Directory"
elif [ -e $name/$database_name ];then
    echo "Starting Remove DataBase"
    cd $name
    rm -r $database_name
    else 
    echo "Can't Find DataBase Folder"

    fi
    
    