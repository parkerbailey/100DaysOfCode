#!/bin/bash
# Author:	Parker Bailey
# Version:	1.0

dest=/mnt/raid/backups/			# set destination for backup directory creation
server=192.168.86.74			# set server ip
clients=(192.168.86.75)			# set client ip(s)
mod=raid				# set rsync daemon module name

## New Code ##
# Plan: 	run backup script only server side. Client data will be pulled if online.
# To-do:	* check if volumes are mounted
#		* check if server backup directory exists (create if no)
#		* backup server (rsync)
#		* check if client backup directory exists (create if no)
#		* backup client (rsync daemon pull)

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

## Old Code ##
# check if destination exists
if [ ! -d $dest ]; then
	if [ $HOSTNAME = "RAIDNAS1" ]; then
		echo "Destination not found on local machine. Ensure volume is properly mounted."
		exit 1
	fi
	echo "Destination not found on local machine. Trying external."
	ping -c 1 $host
	if [ $? -eq 0 ]; then
		echo "Host is online. Initiating remote backup."
		rsync -avzh --stats --progress {/etc,/var,/home} rsync://parker@$host::$mod/backups/$HOSTNAME
		exit 0
	fi
fi

# create destination folder and run backup
if [ ! -d $dest/$HOSTNAME ]; then
	mkdir $dest/$HOSTNAME
fi
sudo rsync -avzh --stats --progress {/etc,/var,/home} $dest/$HOSTNAME
