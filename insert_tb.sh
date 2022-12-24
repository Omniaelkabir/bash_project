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
col_name= awk -F: '{if(NR==4){i=1;while(i<=NF){if(i==0){printf $i " "}else{ printf ("%s " ,$i) };i++}} } END {print ""}' $table_name
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
fi