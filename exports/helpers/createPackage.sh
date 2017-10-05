# Execute CloudClient
$cloudclient_home/bin/cloudclient.sh vra content list --pageSize 100 --format CSV --export /tmp/list-content.txt

# Parse output and massage
cat /tmp/list-content.txt | grep ${type} | awk -F , {'print $1'} | sed '1d' > /tmp/contentIds.txt

# Concatenate all ids into 1 line
awk '{print $1}' < /tmp/contentIds.txt | paste -s -d, - > /tmp/allContent.txt

# Remove ending comma
# sed -i '$s/.$//' /tmp/allContent.txt

$cloudclient_home/bin/cloudclient.sh vra package create --name ${name}-${today} --ids $(cat /tmp/allContent.txt);