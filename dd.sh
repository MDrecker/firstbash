#!/bin/bash

#####################################
## Code to zerofill block of choice #
#####################################


dt=$(date +%m%d%y) ## Creates variable dt with mm/dd/yy info
log=Log-$dt.txt    ## Creates variable log with mm/dd/yy info in name
now=$(date)        ## Creates variable now with date info

echo "$now" > /var/opt/zerofill/$log ## Creates the log file 
printf "\n" >> $log ## Print info to log
usr=$(whoami) ## Getuser
printf $usr >> $log ## Print info to log
printf "\n" >> $log ## Print info to log 
lsblk ## Runs lsblk 
echo "Enter block or block partition to zerofill"
read X ## Scan terminal for input for X
printf "sd" >> $log ## Print info to log
printf $X >> $log ## Printo info to log
zf= dd if=/dev/zero of=/dev/sd$X status=progress && sync ## Actual zerofill execution
echo $zf
echo "End"
