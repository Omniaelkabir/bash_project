#!/bin/bash
 export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex

 read -p "Enter Table Name to Create " table_name
             table_name_number
             table_name_space
while [ -z $table_name  ]
     do
             echo "Empty Value Please inter vaild input"
             read -p "Enter table name again" table_name
             table_name_number
             table_name_space

done
 
while [  -e $table_name  ]
 do
         echo "File has the same name please enter diffrent name"
         read -p "Enter table name again" table_name
         table_name_number
         table_name_space
  done 


while [ true ];do
read -p "Enter the number of columns:" col_num
if ! [[ $col_num =~ ^[0-9]+$ ]];then
echo Column number must be integer number 
elif [[ $col_num -eq 0 ]];then 
echo Enter at least 1 column 
else
break;
fi
done

line4[0]="id" #line1 for col name
line3[0]="INTEGER" #line2 for col name data type


typeset -i i=1
export equal
while (( $i <= $col_num ))
do

	while [ true ]
		do
      read -p "Enter the Column Number.$i Name:" col_name
		if [ -z $col_name ];then
			echo please enter the Name of the column.
elif [[ $col_name == *" "* ]] || [[ $col_name == [1-9]* ]] || [[ $col_name == *['!'';''.'@\$%^\&*()+-='\'?'/''`'~:,'<''>''['']']* ]] ;then
			echo not a good format
		else
	  for col in ${line4[@]}
		  do
		  	
		    if [[ $col == $col_name ]]; then
			equal=1
			echo the column name already exist!
			break 
		    else
		    equal=0
		    fi 
		  done

	  if [[ $equal == 0 ]];then
		  break
	  fi

	fi

done
line4[$i]=$col_name
select data_type in INTEGER STRING
        do
          case $data_type in

               "INTEGER")
                    
                  line3[$i]="INTEGER"
                    break;
                    ;;
               
               "STRING")
                      line3[$i]="STRING"
                    break;
                    ;;
               *)
                    printf "please enter the data_type of field"
                    ;;

          esac
        done

i=$i+1

done

     primary_key(){

          while [ true ]
          do
          
 
          echo "Your table columns are :\n"
          echo "${line4[@]}"

          echo "Enter your PK column index number "
          read pk
               
               #Check validation of pk index number
               if [[ $pk =~ ^[0-9]+$ ]]
               then
                    
                    if [[ $pk -lt $col_num ]]
                    then
          
                              echo "The index of Your primary key column  is: " $pk >> $table_name  
                              echo "---------------------------------" >> $table_name
                              echo  "Successfully add Primary Key "   
                              export pk=$pk
                              break;
                         
                    fi
               else 
                    echo "\n$pk  index column is not exist ,, try again please!\n"

                    #Calling getPk function 
                    primary_key
               fi
               

          done
     }

primary_key
typeset -i i=0
for var in  ${line4[@]}
do
if [[ $i == 0 ]];then
l3=$var
else
l3=$l3:$var
fi
i=$i+1
done
echo  $l3 >> $table_name
typeset -i i=0

for var in  ${line3[@]}
do
if [[ $i == 0 ]];then
l4=$var
else
l4=$l4:$var
fi
i=$i+1

done

echo $l4 >> $table_name


touch $table_name
echo Table $table_name Created Successfuly!



