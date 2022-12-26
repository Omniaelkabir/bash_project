#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex

while [ true ];do

 read -p " Enter name of table that you want to delete from it :" table_name
  table_name=${table_name,,}
table_name_number
table_name_space
if [ -z $table_name  ];then  #table name can not be empty

             echo "Empty Value Please inter vaild input"
             read -p "Enter table name again" table_name
              table_name=${table_name,,}
             table_name_number
             table_name_space

elif [[ -e $table_name ]];then
col_name=`awk -F: '{if(NR==4){i=1;while(i<=NF){if(i==0){printf $i " "}else{ printf ("%s " ,$i) };i++}} } END {print ""}' $table_name`
col_type=( $( awk -F: '{if(NR==3){i=0;while(i<=NF){if(i==0){printf $i " "}else{ printf ("%s " ,$i) };i++}} } END {print ""}' $table_name ) )
echo "Can you select one of these Options??"
        select choice in "Delete all" "Delete record"  "Delete column" "Exit"
        do
                case $choice in
                        "Delete all" )
                        sed -n '1,3p' | truncate -s 0 $table_name  > temp && mv temp $table_name ;;
                        "Delete record" )
                                echo ${col_name[@]}
                                while [ true ];do
                                read -p "Enter row value " value
                                if [[ -z $value ]] ; then
                                echo "Empty Input"
                                elif [[ $value == *" "* ]] || [[ $value == *['!'@\$%^\&*()+]* ]];then
			                echo "value is not in a good format"		
                                else
                                     if grep -i "$value" $table_name 
                           then
                         grep -v "$value" $table_name  > temp && mv temp $table_name
                        else
                       echo "Syntex Error"
                       read -p "Enter row value " value
                                if [[ -z $value ]] ; then
                                echo "Empty Input"
                                elif [[ $value == *" "* ]] || [[ $value == *['!'@\$%^\&*()+]* ]];then
			                echo "value is not in a good format"		
                                else
                                  grep -v "$value" $table_name  > temp && mv temp $table_name
                          fi
                                break
                                fi
                                done
                                ;;

                        "Delete column" )
                                  echo "Your table columns are :"
                                        echo ${col_name[@]}
                                        len=(${col_name[@]})      
                                        while [ true ];do
                                        echo "Enter your column number to select"
                                        read -p "column number " value
                                        if [[ -z $value ]] ; then
                                         echo "Empty Input"
                                        elif ! [[ $value =~ ^[0-9]+$ ]];then
                                        echo Column number must be integer number 
                                        elif [[ $value -eq 0 ]];then 
                                        echo Enter at least 1 column 
                                        else
                                        if [[ $value > ${#len[@]}  ]];then
                                        echo the column does not exist!
                                        else
                                   cut -d: -f$value --complement $table_name > temp && mv temp $table_name
                                                break
                                        fi
                                        fi
                                        done;;

                                        "Exit" )
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
                                 done;;
   
                        *)     
                                        
                                echo "invalid input"
                                ;;
                esac
        done
else
echo "This table not found" ;
fi
done

