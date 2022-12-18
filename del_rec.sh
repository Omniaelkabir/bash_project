 read -p " Enter name of table that you want to delete from it :" table_name
        if [[ -f $table_name ]] ; then

                `awk -F ":" '{if(NR==1) print $1}' $table_name`;

                read -p "Enter Value for $colname Column: " recDel 
                                
                if [[ -z $recDel ]] ; then
                        echo "Empty Input"
                
                elif [[ -n $recDel ]]; then
                        # before delet_rec
                        
                                if [[ $recDel =~ [`cut -d':' -f1 $table_name | grep $recDel`] ]]; then
                                
                                rec_no=`awk 'BEGIN{FS=":"}{if ($1=="'$recDel'") print NR}' $table_name`

                                        sed -n ''$rec_no'd'  $table_name   
                                        echo "Record is deleted successfully"        
                                else              
                                        echo "there is no pk with this number"
                                fi

                        echo  "$table_name ,after deleting"
                else
                        echo "pk not exist"
                fi 
        else 
                echo "Sorry, This table not found" ;     
        fi
