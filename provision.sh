#!/bin/sh
#########################################################################################
#
# CloudClient  : Cloud Solutions Engineering, Management Business Unit, VMware
# Description  : Sample script to request a VSphere Machine
# Date         : December 2015
# Version      : vRA 7.0
#
#########################################################################################
#
# Setup environment variables for auto login to CloudClient Shell
. ./env.sh

location=$1

# Provide CatalogItem/Blueprint and Group Name, a guid or name is supported
export catalog='"Red Hat Linux 7"'
export group='""'

if [ -e  schema/linux/$location.json ] ; then

# Execute CloudClient
        $cloudclient_home/bin/cloudclient.sh vra catalog request submit --id $catalog --groupid $group --reason test  --inputfile schema/linux/$location.json

else
        $cloudclient_home/bin/cloudclient.sh vra catalog request submit --id $catalog --groupid $group --reason test

fi
