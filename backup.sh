#!/bin/bash
# Author:	Parker Bailey
# Version:	1.0

dest=/mnt/raid/backups/				# set destination for backup directory creation
server=192.168.86.74				# set server ip
clients=(192.168.86.75 192.168.86.122)		# set client ip(s) (space-seperated)
mod=raid					# set rsync daemon module name

## New Code ##
# Plan: 	run backup script only server side. Client data will be pulled if online.
#		* check if client backup directory exists (create if no)
#		* backup client (rsync daemon pull)

## server backup
echo "Initializing local server backup"
# check if parent directory exists
if [ ! -d $dest ]; then
        echo "Parent directory not found on local machine. Ensure volume is properly mounted."
        exit 1
else
        # check if child directory exists
        if [ ! -d $dest/$HOSTNAME ]; then
                echo "Creating child directory $dest/$HOSTNAME. . ."
                mkdir -v $dest/$HOSTNAME
        else
                echo "Initializing server backup. . ."
                sudo rsync -avzh --stats --progress {/etc,/var,/home} $dest/$HOSTNAME
        fi

fi

## client backup
for ip in ${clients[@]}; do
	# checking online status
	if ping -c 1 $ip; then
		echo "Client at $ip is online. Initializing backup. . ."
	else
		echo "Client offline. No backup created for $ip."
	fi
done
