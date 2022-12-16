#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex

read -p "Enter Folder Name DB " name
    while [ -z $name ]
    do
            echo "Empty Value Please inter vaild name"
            read name
done
    if [ -e $name ];then
            echo "Folder has the same name"
    else 
        mkdir $name
        chmod 775 $name

    fi
export name=$name



select opt_db in Create_DB List_DB Drop_DB Connect_DB
do
case $opt_db in 
"Create_DB" )
chmod 775 ./create_db.sh
./create_db.sh;;
"List_DB" )
chmod 775 ./list_db.sh
echo ./list_db.sh;;
"Drop_DB" )
    chmod 775 ./drop_db.sh
 ./drop_db.sh;;
"Connect_DB" )
chmod 775 ./connect_db.sh
./connect_db.sh
esac
done 


# select opt_table in Create_Table List_Table Drop_Table Insert_Table Select_from_Table Delete_from_Table Update_Table
# do
# case $opt_table in 
# "Create_Table" )
# chmod 775 ./create_tb.sh
# echo ./create_tb.sh;;
# "List_Table" )
# chmod 775 ./list_tb.sh
# echo ./list_tb.sh;;
# "Drop_Table" )
# chmod 775 ./drop_tb.sh
# echo ./drop_tb.sh ;;
# "Insert_Table" )
# chmod 775 ./insert_tb.sh
# echo ./insert_tb.sh;;
# "Select_from_Table" )
# chmod 775 ./select_from_tb.sh
# echo ./select_from_tb.sh;;
# "Delete_from_Table" )
# chmod 775 ./delete_from_tb.sh
# echo ./delete_from_tb.sh ;;
# "Update_Table" )
# chmod 775 ./update_tb.sh
# echo ./update_tb.sh 
# esac
# done

