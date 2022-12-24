#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex


read -p "Enter name of table that you need to select it : "  table_name
col_name=`awk -F: '{if(NR==4){i=1;while(i<=NF){if(i==0){printf $i " "}else{ printf ("%s " ,$i) };i++}} } END {print ""}' $table_name`
col_type=( $( awk -F: '{if(NR==3){i=0;while(i<=NF){if(i==0){printf $i " "}else{ printf ("%s " ,$i) };i++}} } END {print ""}' $table_name ) )

if [[ -e $table_name ]] ; then
echo "Can you select one of these Options??"
        select choice in "Select all" "Select record"  "Select column"  
        do
                case $choice in
                        "Select all" )
                        sed  -n '4,$p' $table_name
                                    
                                ;;
                        "Select record" )
                                echo ${col_name[@]}
                                while [ true ];do
                                read -p "enter the column name " col_name
                                read -p "Enter colunm value " value
                                if [[ -z $value ]] ; then
                                echo "Empty Input"
                                elif [[ $value == *" "* ]] || [[ $value == *['!'@\$%^\&*()+]* ]];then
			                echo "value is not in a good format"		
                                else
                                grep "$value" $table_name 
                                break;
                 
                                fi 
                                done
                                ;;
                                
                        "Select column" )
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
                                           sed -n '1,3!p' $table_name | cut -d: -f$value    
                                                break
                                        fi
                                        fi
                                        done;;
   
                        *)     
                                        
                                echo "invalid input"
                                ;;
                esac
        done
else
echo "This table not found" ;
fi

