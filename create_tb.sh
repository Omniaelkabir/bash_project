#!/bin/bash
 export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex

 read -p "Enter Table Name to Create " table_name
  read -p "Enter Table Meta Name to Create " table_meta
while [ -z $table_name  ] || [ -z $table_meta  ]
     do
             echo "Empty Value Please inter vaild input"
             if [ -z $table_name  ];then
             read -p "Enter table name again" table_name
             elif
            read table_meta
 done
while [  -e $table_name  ] || [  -e $table_meta  ]
 do
         echo "File has the same name please enter diffrent name"
        read table_name
        read table_meta
  done 
while [  -ne $table_name  ] || [  -ne $table_meta  ]
    do
    echo "Starting Creating Tables " 
    touch $table_name
    touch $table_meta

done


read -p "Enter Number of Fields " number_field
while [[ $i<=$number_field ]]
do
        read -p "Enter Element " element
        for element in $i
        do 
        read -p "enter the name of element" name_element
        if [[ $input =~ ^[+-]?[0-9]+$ ]]; then
            echo "Input is an integer."
            declare -i name_element
        elif [[ $input =~ ^[+-]?[0-9]+\.$ ]]; then
        echo "Input is a string."
        done
        echo $element
        ((i=$i+1))
        $name_element>>$table_meta


done





