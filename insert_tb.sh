#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex
read -p "Enter Table Name to insert " table_name
            table_name_number
            table_name_space
while [ -z $table_name ]
    do
            echo "Empty Value Please enter vaild input"
            read -p "Pealse enter Table Name Again" table_name
            table_name_number
            table_name_space
    done
if [ -e $table_name ];then
select opt in "Insert_Record" "Exit"
       do
	   case $opt in  
	   "Insert_Record" ) 
col_name=`awk -F: '{if(NR==4){i=1;while(i<=NF){if(i==0){printf $i " "}else{ printf ("%s " ,$i) };i++}} } END {print ""}' $table_name`
col_type=( $( awk -F: '{if(NR==3){i=0;while(i<=NF){if(i==0){printf $i " "}else{ printf ("%s " ,$i) };i++}} } END {print ""}' $table_name ) )
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
				
				if [[ ${col_name[$i]} == $pk ]];then
						if grep -i $Data $table_name
						then 
						echo "value exist"
                         read -p "please enter data again" Data
						 break;
                      else
					  echo "added successfully"
					  break;
					  fi
					fi
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
     fi