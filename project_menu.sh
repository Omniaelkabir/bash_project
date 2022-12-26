#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex
select opt_db in Create_DB List_DB Drop_DB Connect_DB Exit
do
case $opt_db in 
"Create_DB" )
chmod 775 ./create_db.sh    #change permission to file to enter
./create_db.sh;;
"List_DB" )
chmod 775 ./list_db.sh
./list_db.sh;;
"Drop_DB" )
chmod 775 ./drop_db.sh
 ./drop_db.sh;;
"Connect_DB" )
chmod 775 ./connect_db.sh
./connect_db.sh;;
"Exit")
break ;;
* )
echo "enter valid option"
esac
done 