#!/bin/bash

export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex
echo "Note that the record you update will remove and i will ask you to enter the data agian"
while [ true ];do
   read -p "Enter name of table that you need to update : "  table_name
   table_name=${table_name,,}
   table_name_number
   table_name_space
if [ -z $table_name  ];then  #table name can not be empty

   echo "Empty Value Please inter vaild input"
   read -p "Enter table name again" table_name
   table_name=${table_name,,}
   table_name_number
   table_name_space

elif [[ -e $table_name ]] ; then
    col_name=`awk -F: '{if(NR==4){i=1;while(i<=NF){if(i==0){printf $i " "}else{ printf ("%s " ,$i) };i++}} } END {print ""}' $table_name`
    col_type=( $( awk -F: '{if(NR==3){i=0;while(i<=NF){if(i==0){printf $i " "}else{ printf ("%s " ,$i) };i++}} } END {print ""}' $table_name ) )
    echo ${col_name[@]}
    while [ true ];do
        read -p "Enter row value you want to delete " value
        if [[ -z $value ]] ; then
            echo "Empty Input"
        elif [[ $value == *" "* ]] || [[ $value == *['!'@\$%^\&*()+]* ]];then
			echo "value is not in a good format"		
        else
			if grep -i "$value" $table_name 
                then
				select choice in 'yes' 'no'   #menu to ask user if he/she was sure from droping table
                    do 
                    case $choice in
                         'yes') 
                        echo "Starting Remove record"
                        grep -v "$value" $table_name  > temp && mv temp $table_name  
                        echo "Record \"$value\" is deleted Successfully"
                        select opt in "Insert_Record" "Exit"
                             do
                             case $opt in 
                                 "Insert_Record" )
                                 fields=( $( awk -F: '{}END{print NF}' $table_name ) )
                                ((fields--))
                             i=1  #first datatype element
                                for nam in $col_name
                                     do	
	                                 while [ true ];
	                                    do
		                                printf "Enter %s and it's a %s : \n" $nam ${col_type[$i]}
		                                read Data
		                                if [[ $Data == *" "* ]] || [[ $Data == *['!'@\$%^\&*()+]* ]] ;then
			                                echo "Data is not in a good format"		
		                                elif  [ -z  $Data ];then
			                                echo please enter the Data
		                                else
			                                if [[ ${col_type[$i]} == "INTEGER" ]];then
				                            if [[ $Data == *[0-9] ]];then
											while [[ ${col_name[$i]} == $pk ]];do
						                        if grep -i $Data $table_name
						                            then 
						                            echo "value exist"
                                                    read -p "please enter data again" Data
						                            break;
                                                else
					                                echo "added successfully"
					                                break;
					                            fi
					                        done
					                    if [ $i -eq $fields ];then
						                    printf $Data":">> $table_name
					                    else
						                    printf $Data":">> $table_name
					                        fi
					                            echo Data Enterd\!
					                            break
				                            else
					                            echo "this is not an INTEGER"
				                            fi
			                            elif [[ ${col_type[$i]} == "STRING" ]];then
				                        if [[ $Data == *([A-Z-a-z-_]) ]];then
										while [[ ${col_name[$i]} == $pk ]];do
						                    if grep -i $Data $table_name
						                    then 
					                            echo "value exist"
                                                read -p "please enter data again" Data
						                        break;
                                                else
					                            echo "added successfully"
					                            break;
					                            fi
					                         done
					                        if [ $i -eq $fields ];then
						                        printf $Data":">> $table_name
					                        else
						                        printf $Data":">> $table_name
					                        fi
					                            echo Data enterd\!
					                         break
				                            else
					                            echo "this is not a STRING"
				fi
			fi
		fi
	done
	                                            ((i++))
done
                                                printf "\n">> $table_name

                                                ;;

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
                            "Main_Menu" )
                            chmod 775 ./project_menu.sh
                            echo "you enter main menu"
                            ./project_menu.sh;;
	                        * )
                            echo "enter vaild option" ;;

	 	 esac
	 done ;;
 

	* )
	echo "enter vaild option"

esac
done
                                            ;;
                                          'no') 
                                         echo "Exit"
                                          exit
                                          ;;
                                        *) 
                                     echo "Choose Valid Option" ;;
                                       esac
                                       done
                                    
else
echo "can not find this value"
fi
                                fi
                                done 
								

fi
done