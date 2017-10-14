#!/bin/sh
#########################################################################################
#
# Description  : Script to import exported ZIPs
# Date         : October 2017
# Version      : vRA 7+
#
#########################################################################################
#

read -p "Enter full path of zip file to import: " fullPathZip

if [ -e ${fullPathZip} ] ; then

  # Setup environment variables for auto login to CloudClient Shell
  . ./env.sh

  # Execute CloudClient
  $cloudclient_home/bin/cloudclient.sh vra content import --path ${fullPathZip} --resolution OVERWRITE --precheck WARN --verbose

  # Logout CloudClient
  $cloudclient_home/bin/cloudclient.sh vra logout

else
  echo "Error: File Not Found. Check the path of your zip file"

fi