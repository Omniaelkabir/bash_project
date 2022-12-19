#!/bin/bash

# Now Validate if the user input is a number using regex (Integer or Float). If not, display appropriate message and stop execution of script 
read -p "enter Name " name

# read -p "Enter DataBase Name to Drop " database_name
# case "$database_name" in
#   *\ * )

#            name="${name// /_}"
#            echo $name ;;
        

# esac 

# case "$name" in  
#      *\ * )
           
#            name="${name// /_}"
#            echo $name
#           ;;
#        *)
#            echo "no match"
#            ;;
# esac


if [[ $name =~ ^[+-]?[0-9]+\.?[0-9]* ]];then

    echo "Inputs must be a numbers" 
    exit 0 
else
echo "right"    
fi

# if [[ name="${name//\@/\\\'}" ]];then
#     echo "error"
#     read -p "enter Name " name
# else
# echo "right"
# fi

# name="~#gggff@@gg"
# name="${name//[~!$%^&#@.]/\ }"
# # B="${name//\./\_}"
# echo $name
# case "$name" in  
#      *\ * )
           
#            name="${name// /_}"
#            echo $name
#           ;;
#    esac