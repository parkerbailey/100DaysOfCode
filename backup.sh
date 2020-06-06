#!/bin/bash

dest=/mnt/raid/backups/			# set destination for backup directory creation

# check if destination exists
if [ ! -d $dest ]; then
	echo "Destination is not mounted. Exiting with error code."
	exit 1
fi

# create destination folder and run backup
if [ ! -d $dest/$HOSTNAME ]; then
	mkdir $dest/$HOSTNAME
fi
rsync -avz --stats --progress {/etc/,/var/,/home/} $dest/$HOSTNAME

