#!/bin/bash

dt=$(date +%m%d%y)
log=Log-$dt.txt
now=$(date)
echo "$now" > /var/opt/zerofill/$log
printf "\n" >> $log
usr=$(whoami)
printf $usr >> $log
printf "\n" >> $log
lsblk
echo "Enter block or block partition to zerofill"
read X
printf "sd" >> $log
printf $X >> $log
zf= dd if=/dev/zero of=/dev/sd$X status=progress && sync
echo $zf
echo "End"
