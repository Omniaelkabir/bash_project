#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex

 read -p "Enter Table Name to List " table_name    #enter table name and checking for spaces, numbers and special
              table_name=${table_name,,}
             table_name_number
             table_name_space
while [ -z $table_name  ]  #table name can not be empty
do

             echo "Empty Value Please inter vaild input"
             read -p "Enter table name again" table_name
              table_name=${table_name,,}
             table_name_number
             table_name_space

done
  
if [  -e $table_name  ];then  #starting listing all information about table
 
         echo "Starting list table $table_name"
        cat $table_name
 


 else

    echo "Can not find table" 
     read -p "Enter Table Name Again to List " table_name
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
