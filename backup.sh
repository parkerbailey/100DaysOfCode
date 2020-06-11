#!/bin/bash
# Author:	Parker Bailey
# Version:	1.0

# variable definitions
dest=/mnt/raid/backups/				# set destination for backup directory creation
server=192.168.86.74				# set server ip
clients=(192.168.86.75)				# set client ip(s) (space-seperated)
mod=raid					# set rsync daemon module name

# color definitions
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

## New Code ##
# Plan: 	run backup script only server side. Client data will be pulled if online.
# To-do:
#		* check if client backup directory exists (create if no)
#		* backup client (rsync daemon pull)

# check if parent directory exists
if [ ! -d $dest ]; then
        echo -e "${RED}Parent directory not found on local machine. Ensure volume is properly mounted.${NC}"
        exit 1
else
echo -e "${GREEN}Begin server backup ===========================================================================${NC}"
        # check if child directory exists for server
        if [ ! -d $dest/$HOSTNAME ]; then
                echo -e "${GREEN}Creating child directory $dest/$HOSTNAME. . .${NC}"
                mkdir $dest/$HOSTNAME
        else
                sudo rsync -avzh --stats --progress --delete {/etc,/var,/home} $dest/$HOSTNAME
        fi
echo -e "${GREEN}Server backup complete.${NC}"
echo -e "${GREEN}Begin client backup ==========================================================================${NC}"
	# loop through client list, check if online, and run backup
	for ip in ${clients[@]}; do
		ping -c 1 -q $ip
		if [ $? -eq 0 ]; then
			name=$(ssh parker@$ip hostname)
			if [ ! -d $dest/$name ]; then
				mkdir $dest/$name
			fi
			echo -e "${GREEN}$name online. Beginning backup. . .${NC}"
			sudo rsync -avzh --stats --progress --delete parker@$ip:{/etc,/var,/home} $dest/$name}
			echo "${GREEN}$name backup complete.${NC}"
			unset name
		else
			echo -e "${RED}$ip offline or unreachable. No backup created.${NC}"
		fi
	done
fi
