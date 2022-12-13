#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex

read -p "Enter Folder Name DB " name
            if [ -e $name ];then
                echo "Folder has the same name"
            else 
                mkdir $name
                chmod 775 $name
                
            fi
export name=$name


select choise in DataBase Table
do
case $choise in 
"DataBase")
select opt_db in Create_DB List_DB Drop_DB Connect_DB
do
case $opt_db in 
"Create_DB" )
chmod 775 ./create_db.sh
echo ./create_db.sh;;
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
done ;;

"Table")
select opt_table in Create_Table List_Table Drop_Table 
do
case $opt_table in 
"Create_Table" )
chmod 775 ./create_tb.sh
echo ./create_tb.sh;;
"List_Table" )
chmod 775 ./list_tb.sh
echo ./list_tb.sh;;
"Drop_Table" )
chmod 775 ./drop_tb.sh
echo ./drop_tb.sh
esac
done

esac
done