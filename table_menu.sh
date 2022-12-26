#!/bin/bash
export LC_COLLATE=C # Terminal Case Sensitive
shopt -s extglob #import Advanced Regex


select opt in Create_Table List_Table Drop_Table Insert_Table Select_from_Table Delete_from_Table Update_Table Exit
        do
        case $opt in 
        "Create_Table" )
        chmod 775 ../.././create_tb.sh
         ../.././create_tb.sh;;
        "List_Table" )
        chmod 775  ../.././list_tb.sh
         ../.././list_tb.sh ;;
        "Drop_Table" )
        chmod 775 ../.././drop_tb.sh
         ../.././drop_tb.sh;;
        "Insert_Table" )
        chmod 775 ../.././insert_tb.sh
        ../.././insert_tb.sh;;
        "Select_from_Table" )
        chmod 775 ../.././select_from_tb.sh
        ../.././select_from_tb.sh;;
        "Delete_from_Table" )
        chmod 775 ../.././delete_from_tb.sh
        ../.././delete_from_tb.sh ;;
        "Update_Table" )
        chmod 775 ./update_tb.sh
        echo ./update_tb.sh;;
        "Exit")
        exit ;;
        * )
            echo "enter valid option";;
        esac
        done