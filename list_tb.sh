read -p "Enter your Database name: " dbname
        
                if [[ $dbname ]]; then
                        echo "All tables in Our Database"
                        ls ;
                        echo "You Finshed"
                else
                        echo "you don't have DB "
                        exit;
                fi
        