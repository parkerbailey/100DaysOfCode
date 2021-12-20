#!/bin/bash
# Author: 	Parker Bailey
# Date:		12/14/2021
# Version:	1.0

# Local Backup Script
filename="${HOSTNAME}_backup_`date +%m`_`date +%d`_`date +%Y`.tar";
backup_dir=/mnt/md0/.backups/
tar -cpzf backup_dir/filename /
