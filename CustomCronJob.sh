#!/bin/bash

# @Author : Siddhi Naik, CWID: A20444173
#The Shell Script "CustomCronJob" runs a script that lets user create a custom cronjob
#And then lets user add more jobs, modify or delete them 

hostname=`hostname`

echo "Welcome to Custom Cronjob Creator"
echo "-----------------------------------------------------------------------------------"
echo "Please enter your cronjob process in the following format and press Ctrl + D when done:"
echo "* * * * * username command to be executed" && cat > cronjob.txt
crontab ./cronjob.txt
echo "Your Chronjob has been created successfully !"
echo "Do you wish to continue ? If yes press 'Y' else press 'N' "
echo "-----------------------------------------------------------------------------------"

read choice 

while [ $choice == "Y" ]
do
    echo "Please Select Choice from the options below :"
    echo "-----------------------------------------------------------------------------------"
    echo "1. Create New Cron Job 
          2. Modify Crontab
          3. View the existing Cronjob
          4. Delete CronTab"
    echo "-----------------------------------------------------------------------------------"
    read c

    if [ $c == "1" ]; then
        echo "Please enter your new cronjob process in the following format"
        echo  "And press Ctrl + D when done:"
        echo "***** username command to be executed" && cat > cronjob1.txt
        cat cronjob1.txt >> cronjob.txt 
        crontab ./cronjob.txt
        echo "Your Chronjob has been created successfully !"

        echo "Do you wish to continue ? If yes press 'Y' else press 'N' "
        read choice
        echo "----------------------------------------------------------------------------------"

    elif [ $c == "2" ]; then 
        echo "Please Edit the cronjob"
        crontab -e 
        crontab -l > cronjob.txt
        echo  "Cronjob has been Edited Successfully"
        echo "Do you wish to continue ? If yes press 'Y' else press 'N' "
        read choice
        echo "----------------------------------------------------------------------------------"

    elif [ $c == "3" ]; then 
        echo "The Current Cronjobs present are:"
        crontab -l 
        echo "Do you wish to continue ? If yes press 'Y' else press 'N' "
        read choice
        echo "----------------------------------------------------------------------------------"

    elif [ $c == "4" ]; then 
        echo "Are you sure you want to delete crontab ??"
        echo "Please enter a choice Y for Yes or N for No"
        read ch
        echo "----------------------------------------------------------------------------------" 

        if [ $ch == "Y" ]; then 
            echo "Crontab has been deleted Successfully !!"
            crontab -r
            echo "Do you wish to continue ? If yes press 'Y' else press 'N' "
            read choice
            echo "------------------------------------------------------------------------------"

        elif [ $ch == "N" ]; then 
            echo "File not deleted !"
            echo "Do you wish to continue ? If yes press 'Y' else press 'N' "
            read choice
            
            fi
        
    fi
done

echo "Thank you for using cronjob process "

exit 0