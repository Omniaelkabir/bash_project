#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex
# read -p "To Drop Table Please Enter its Database " db_name
# if [[ $db_name=="" ]];then
#     echo "Empty Input Please inter vaild input"
#     read db_name
# else 

read -p "Enter Table Name to Drop " table_name
    while [ -z $table_name ]
    do
            echo "Empty Value Please enter vaild input"
            read $table_name
done
if [[ -d $table_name ]];then
    echo "Can't Remove Folder Please Enter Right File"
elif [ -e $table_name ];then
    echo "Starting Remove Table"
    rm -r $table_name
    else 
    echo "Can't Find Table "

    fi
