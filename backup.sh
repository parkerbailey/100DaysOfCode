#!/bin/bash

dest=/mnt/raid/backups/			# set destination for backup directory creation
host=69.28.47.153			# set remote host ip
port=12345				# set remote host port

# check if destination exists
if [ ! -d $dest ]; then
	if [ $HOSTNAME = "RAIDNAS1" ]; then
		echo "Destination not found on local machine. Ensure volume is properly mounted."
		exit 1
	fi
	echo "Destination not found on local machine. Trying external."
	ping -c 1 $host 
	if [ $? -eq 0 ]; then
		echo "Host is online. Initiating connection."
		
		exit 1
	fi
fi

# create destination folder and run backup
if [ ! -d $dest/$HOSTNAME ]; then
	mkdir $dest/$HOSTNAME
fi
sudo rsync -avzh --stats --progress {/etc/,/var/,/home/} $dest/$HOSTNAME

