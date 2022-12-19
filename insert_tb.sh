#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex
 read -p "Enter Table Name to insert " TableName
ColName=`awk -F: '{if(NR==1){i=1;while(i<=NF){if(i==0){printf $i " "}else{ printf ("%s " ,$i) };i++}} } END {print ""}' $TableName`
ColType=( $( awk -F: '{if(NR==2){i=0;while(i<=NF){if(i==0){printf $i " "}else{ printf ("%s " ,$i) };i++}} } END {print ""}' $TableName ) )
fields=( $( awk -F: '{}END{print NF}' $TableName ) )
((fields--))
i=1

for Name in $ColName
do	
	while [ true ];
	do
		printf "Enter %s and it's a %s : \n" $Name ${ColType[$i]}
		read Data
		if [[ $Data == *" "* ]] || [[ $Data == *['!'@\$%^\&*()+]* ]] ;then
			echo Data is not \in a good format			
		elif  [ -z  $Data ];then
			echo please enter the Data
		else
			if [[ ${ColType[$i]} == "INTEGER" ]];then
				if [[ $Data == *[0-9] ]];then
					if [ $i -eq $fields ];then
						printf $Data":">> $TableName
					else
						printf $Data":">> $TableName
					fi
					echo Data Enterd\!
					break
				else
					echo "this is not an INTEGER"
				fi
			elif [[ ${ColType[$i]} == "STRING" ]];then
				if [[ $Data == *([A-Z-a-z-_]) ]];then
					if [ $i -eq $fields ];then
						printf $Data":">> $TableName
					else
						printf $Data":">> $TableName
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
printf "\n">> $TableName