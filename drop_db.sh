#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex
echo $name

read -p "Enter DataBase Name to Drop " input
if [[ -f $input ]];then
    echo "Can't Remove File Please Enter Right Directory"
elif [ -e $name/$input ];then
    echo "Starting Remove DataBase"
    cd $name
    rm -r $input
    else 
    echo "Can't Find DataBase Folder"

    fi
    