#!/bin/sh
#########################################################################################
#
# CloudClient  : Cloud Solutions Engineering, Management Business Unit, VMware
# Description  : Script to export all blueprints
# Date         : February 2016
# Version      : vRA 7.0
# https://vsential.com/2016/02/26/export-vrealize-automation-7-blueprints
#
#########################################################################################
#
# Setup environment variables for auto login to CloudClient Shell
. ./env.sh

export name="propertyGroup"
export type="property-group"

# Execute CloudClient
$cloudclient_home/bin/cloudclient.sh vra content list --pageSize 100 --format CSV --export /tmp/list-content.txt

# Parse output and massage
cat /tmp/list-content.txt | grep ${type} | awk -F , {'print $1'} | sed '1d' > /tmp/contentIds.txt

# Concatenate all ids into 1 line
awk '{print $1}' < /tmp/contentIds.txt | paste -s -d, - > /tmp/allContent.txt

$cloudclient_home/bin/cloudclient.sh vra package create --name ${name}-${today} --ids $(cat /tmp/allContent.txt);

# Execute CloudClient
$cloudclient_home/bin/cloudclient.sh vra package list --format CSV --export /tmp/list-package.txt

# Parse output and massage
cat /tmp/list-package.txt | grep ${name} | awk -F , {'print $1'} > /tmp/package.txt

$cloudclient_home/bin/cloudclient.sh vra package export --pkgId $(cat /tmp/package.txt) --path /tmp/${name}

# Logout CloudClient
$cloudclient_home/bin/cloudclient.sh vra logout

# Cleanup
rm /tmp/*.txt -f