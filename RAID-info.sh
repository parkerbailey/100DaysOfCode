#!/bin/bash

cmd='sudo mdadm --detail /dev/md0'

echo "Current RAID information"
echo "------------------------------------------------------------------"
$cmd | grep -m1 "State"
$cmd | grep "Active"
$cmd | grep "Working"
$cmd | grep "Failed"
$cmd | grep "Spare"
$cmd | grep "Rebuild Status"
