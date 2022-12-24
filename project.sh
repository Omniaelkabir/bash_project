#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex

database_name_space() {   #for space in database files

                case "$database_name" in  
     *\ * )
           
           database_name="${database_name// /_}"
        #    echo $database_name
          ;;
esac
}

table_name_space(){      #for space in tables files

    case "$table_name" in  
     *\ * )
           
           table_name="${table_name// /_}"
        #    echo $table_name
          ;;
esac    
}

database_name_number() {  #for snumber and Soecail characters in database files
    while [[ $database_name == [1-9]* ]] || [[ $database_name == *['!'';''.'@\$%^\&*()+-='\'?'/''`'~:,'<''>''['']']* ]];do

        echo "Can not start with numbers or special characters " 
        read -p "Enter DataBase Name Again " database_name
done
}

table_name_number(){                      #for snumber and Soecail characters in tables files
 
    while [[ $table_name == [1-9]* ]] || [[ $table_name == *['!'';''.'@\$%^\&*()+-='\'?'/''`'~:,'<''>''['']']* ]];do
        echo "Can not start with numbers or special characters " 
        read -p "Enter table Name Again " table_name
done

}

#export function to other files

export -f database_name_space
export -f table_name_space
export -f table_name_number
export -f database_name_number

#read folder to put database folder in 

read -p "Enter Folder Name DB " name
            case "$name" in  
     *\ * )
           
           name="${name// /_}"
          ;;
esac 
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


#menu to choise from
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
exit ;;
* )
echo "enter valid option"
esac
done 

