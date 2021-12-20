#!/bin/bash
# This script is not entirely my own, but the original author did not give their name
# I have modified this script to suit my purposes as an MOTD display script
# Thank you to whoever originally built this script, your code is nice
#  - Parker Bailey

sudo clear					# clears terminal window
sudo mount /dev/md0 /mnt/md0 &> /dev/null	# mounts raid array and pipes output ot null

#
# Test whether bash supports arrays.
# (Support for arrays was only added recently.)
#
whotest[0]='test' || (echo 'Failure: arrays not supported in your version of bash. Must be at least version 4 to have associative arrays.' && exit 2)

#############################################################################
#                                SETTINGS                                   #
# Comment with a # messages you don't want displayed                        #
# Change order of items in array to change order of displayed messages      #
#############################################################################

settings=(
#    LOGOSMALL
#    LOGOBIG
    LOGOCUSTOM
    SYSTEM
    DATE
    UPTIME
    MEMORY
    DISKS
    RAID
    LOADAVERAGE
    PROCESSES
    IP
    WEATHER
    CPUTEMP
#    GPUTEMP
    SSHLOGINS
    LASTLOGIN
#    MESSAGES
)

# Accuweather location codes: https://github.com/SixBytesUnder/custom-motd/blob/master/accuweather_location_codes.txt
weatherCode="NAM|US|WA|VANCOUVER"

# Show temperatures in "C" for Celsius or "F" for Fahrenheit
degrees=F

# Colour reference
#    Colour    Value
#    black       0
#    red         1
#    green       2
#    yellow      3
#    blue        4
#    magenta     5
#    cyan        6
#    white       7
declare -A colour=(
    [header]=$(tput setaf 6)
    [neutral]=$(tput setaf 2)
    [info]=$(tput setaf 4)
    [warning]=$(tput setaf 1)
    [reset]=$(tput sgr0)
)


#############################################################################
#                                                                           #
# DO NOT TOUCH ANYTHING BELOW THIS POINT, UNLESS YOU KNOW WHAT YOU'RE DOING #
#                                                                           #
#############################################################################

# Expects two arguments:
# $1 is the header
# $2 is the message
function displayMessage {
    if [ -z "$1" ]; then
        echo "${colour[neutral]}$2"
    else
        while read line; do
            echo "${colour[header]}$1 ${colour[neutral]}$line";
        done <<< "$2"
    fi
}

function metrics {
    case "$1" in
    'LOGOSMALL')
        logo="${colour[neutral]}
         \\\ // ${colour[warning]}
         ◖ ● ◗
        ◖ ● ● ◗ ${colour[neutral]}Raspberry Pi${colour[warning]}
         ◖ ● ◗
           •
        "
        displayMessage '' "$logo"
        ;;
    'LOGOBIG')
        logo="${colour[neutral]}
          .~~.   .~~.
         '. \ ' ' / .'${colour[warning]}
          .~ .~~~..~.                      _                          _ 
         : .~.'~'.~. :     ___ ___ ___ ___| |_ ___ ___ ___ _ _    ___|_|
        ~ (   ) (   ) ~   |  _| .'|_ -| . | . | -_|  _|  _| | |  | . | |
       ( : '~'.~.'~' : )  |_| |__,|___|  _|___|___|_| |_| |_  |  |  _|_|
        ~ .~ (   ) ~. ~               |_|                 |___|  |_|    
         (  : '~' :  )
          '~ .~~~. ~'
              '~'
	"
        displayMessage '' "$logo"
        ;;
    'LOGOCUSTOM')
	logo="${colour[warning]}
	   ___  ___   _______  _  _____   ____  ___
	  / _ \/ _ | /  _/ _ \/ |/ / _ | / __/ <  /
	 / , _/ __ |_/ // // /    / __ |_\ \   / /
	/_/|_/_/ |_/___/____/_/|_/_/ |_/___/  /_/
	"
	displayMessage '' "$logo"
	;;
    'SYSTEM')
        displayMessage 'System.............:' "$(uname -snrmo)"
        ;;
    'DATE')
        displayMessage 'Date...............:' "$(date +"%A, %e %B %Y, %r")"
        ;;
    'UPTIME')
        let upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
        let sec=$((${upSeconds}%60))
        let min=$((${upSeconds}/60%60))
        let hour=$((${upSeconds}/3600%24))
        let day=$((${upSeconds}/86400))
        displayMessage 'Uptime.............:' "$(printf "%d days, %02dh %02dm %02ds" "$day" "$hour" "$min" "$sec")"
        ;;
    'MEMORY')
        displayMessage 'Memory.............:' "$(cat /proc/meminfo | grep MemFree | awk {'print $2/1000000'}) GB (Free) / $(cat /proc/meminfo | grep MemTotal | awk {'print $2/1000000'}) GB (Total)"
        ;;
    'DISKS')
        displayMessage 'Disk...............:' "$(df -hT -x tmpfs -x vfat | grep "^/dev/" | awk '{print $1" - "$5" (Free) / "$3" (Total)"}')"
        ;;
    'RAID')
	state=$(sudo mdadm --detail /dev/md0 | grep -m1 "State" | awk {'print $3 $4 $5'})
	active=$(sudo mdadm --detail /dev/md0 | grep "Active" | awk {'print $4'})
	working=$(sudo mdadm --detail /dev/md0 | grep "Working" | awk {'print $4'})
	failed=$(sudo mdadm --detail /dev/md0 | grep "Failed" | awk {'print $4'})
	spare=$(sudo mdadm --detail /dev/md0 | grep "Spare" | awk {'print $4'})
	rstatus=$(sudo mdadm --detail /dev/md0 | grep "Rebuild Status" | awk {'print $4'})
	displayMessage 'RAID...............:' "State: ${state}"
	displayMessage 'RAID...............:' "Active: ${active}, Working: ${working}, Failed: ${failed}, Spare: ${spare}"
	if [ $active != $working ]; then
		displayMessage 'RAID...............:' "Rebuild Status: ${rstatus}"
	fi
	if [ $failed != 0 ]; then
		displayMessage 'RAID...............:' "Drive failure! Replace immediately!"
	fi
	if mount | grep md0 > /dev/null; then
		mnt=$(mount | grep md0 | awk {'print $3'})
		displayMessage 'RAID...............:' "RAID succesfully mounted on ${mnt}"
	else
		displayMessage 'RAID...............:' "RAID failed to mount"
	fi
	;;
    'LOADAVERAGE')
        read one five fifteen rest < /proc/loadavg
        displayMessage 'Load average.......:' "${one}, ${five}, ${fifteen} (1, 5, 15 min)"
        ;;
    'PROCESSES')
        displayMessage 'Running processes..:' "$(ps ax | wc -l | tr -d " ")"
        ;;
    'IP')
        iipeth0=$(ifconfig eth0 | grep -o -P '(?<=inet ).*(?=  netmask)')
        iipwlan0=$(ifconfig wlan0 | grep -o -P '(?<=inet ).*(?=  netmask)')
	eip=$(wget -q -O - http://icanhazip.com/ | tail)
	displayMessage 'Internal IP........:' "${iipeth0} (eth0), ${iipwlan0} (wlan0)"
	displayMessage 'External IP........:' "${eip}"
	;;
    'WEATHER')
        if [ "$degrees" == "F" ]; then
            metric=0
        else
            metric=1
        fi
        displayMessage 'Weather............:' "$(curl -s "http://rss.accuweather.com/rss/liveweather_rss.asp?metric=$metric&locCode=$weatherCode" | sed -n '/Currently:/ s/.*: \(.*\): \([0-9]*\)\([CF]\).*/\2°\3, \1/p')"
        ;;
    'CPUTEMP')
        cpu=$(</sys/class/thermal/thermal_zone0/temp)
        cpu=$(echo "${cpu} 100 0.1" | awk '{printf "%.2f\n", $1/$2*$3}')
        displayMessage 'CPU temperature....:' "${cpu}°C"
        ;;
    'GPUTEMP')
        gpu=$(/opt/vc/bin/vcgencmd measure_temp | awk -F "[=']" '{print $2}')
        displayMessage 'GPU temperature....:' "${gpu}°C"
        ;;
    'SSHLOGINS')
        displayMessage 'SSH logins.........:' "Currently $(who -q | cut -c "9-11" | sed "1 d") user(s) logged in."
        ;;
    'LASTLOGIN')
	displayMessage 'Last login.........:' "$(last -2 -a -F | awk 'NR==2 {print $1,"on",$3,$4,$5,$6,$7,"from " $15}')"
        ;;
    'MESSAGES')
        displayMessage 'Last 3 messages....:' ""
        displayMessage '' "${colour[reset]}$(tail -3 /var/log/messages)"
        ;;
    *)
        # default, do nothing
        ;;
    esac
}


for K in "${!settings[@]}";
do
    metrics "${settings[$K]}"
done

echo "${colour[reset]}"
