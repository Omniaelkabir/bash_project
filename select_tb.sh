
read -p "Enter name of table that you need to select it : "  table_name
        
if [[ -f $table_name ]] ; then
echo "Can you select one of these Options??"
        select choice in "Select all" "Select record"  "Select column"  
        do
                case $choice in
                        "Select all" )
                                    
                                ;;
                        "Select record" )

                           colname=`awk -F ":" '{if(NR==1) print $1}' $table_name`;

                                read -p "Enter your $colname: " value

                                if [[ -z $value ]] ; then
                                        echo "Empty Input"
                                else
                                                
                                  if [[ $value =~ [`cut -d':' -f1 $table_name | grep  $value`] ]]; then
            
                                  reco_n=$(awk 'BEGIN{FS=":"}{if ( $1 == "'$value'" ) print NR}' $table_name)

                                  echo $(awk 'BEGIN{FS=":";}{if ( NR == '$reco_n' ) print $0 }' $table_name)

                                       fi 
                                fi 
                                ;;
                                
                        "Select column" )
                                read -p "enter column number you want to select : " value 

                                while ! [[ $value =~ ^[1-9]+$ ]]
                                do
                                        read -p "Column Number Must be Integer : " value 

                                done
                                        cut -d':' -f$value $tbName              
                                ;;      
                        *)     
                                        
                                echo "invalid input"
                                ;;
                esac
        done
else
echo "This table not found" ;
fi

