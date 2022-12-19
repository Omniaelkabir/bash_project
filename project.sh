#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex

database_name_space() {

                case "$database_name" in  
     *\ * )
           
           database_name="${database_name// /_}"
        #    echo $database_name
          ;;
esac
}

table_name_space(){

    case "$table_name" in  
     *\ * )
           
           table_name="${table_name// /_}"
        #    echo $table_name
          ;;
esac    
}

database_name_number() {
    while [[ $database_name == [1-9]* ]] || [[ $database_name == *['!'';''.'@\$%^\&*()+-='\'?'/''`'~:,'<''>''['']']* ]];do

        echo "Can not start with numbers " 
        read -p "Enter DataBase Name Again " database_name
done
}

table_name_number(){

    while [[ $table_name == [1-9]* ]] || [[ $table_name == *['!'';''.'@\$%^\&*()+-='\'?'/''`'~:,'<''>''['']']* ]];do
        echo "Can not start with numbers or special characters " 
        read -p "Enter table Name Again " table_name
done

}


export -f database_name_space
export -f table_name_space
export -f table_name_number
export -f database_name_number

read -p "Enter Folder Name DB " name
    while [ -z $name ]
    do
            echo "Empty Value Please inter vaild name"
            read name
done
    if [ -e $name ];then
            echo "Folder has the same name"
    else 
            case "$name" in  
     *\ * )
           
           name="${name// /_}"
          ;;
esac 
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

