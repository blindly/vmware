#!/bin/sh
#########################################################################################
#
# Description  : Script to decomission all active deployments
# Date         : Feb 2018
# Version      : vRA 7+
#
#########################################################################################
#
# Setup environment variables for auto login to CloudClient Shell
. ./env.sh

read -p "Enter full user whose items you wish to destroy: " owners

# if [ -n ${owners} ] && [ -f ${owners} ] ; then
# TODO: Add flag to remove only deployments for a specific user
# TODO: Add page numbers
# $cloudclient_home/bin/cloudclient.sh vra deployment list --columns id,owners ${owners} --format CSV --export /tmp/deployments.csv
# Execute CloudClient
$cloudclient_home/bin/cloudclient.sh vra deployment list --columns id --format CSV --export /tmp/deployments.csv

if [ -e /tmp/deployments.csv ] ; then

  for id in $(cat /tmp/deployments.csv); do
    echo "Running: vra deployment action execute --action Destroy --id $id"
    $cloudclient_home/bin/cloudclient.sh vra deployment action execute --action Destroy --id $id
  done

else
  echo "Failed to find deployments"
fi

# Logout CloudClient
$cloudclient_home/bin/cloudclient.sh vra logout

# Cleanup
rm /tmp/test/*.csv -f
