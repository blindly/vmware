# Execute CloudClient
$cloudclient_home/bin/cloudclient.sh vra package list --format CSV --export /tmp/list-package.txt

# Parse output and massage
cat /tmp/list-package.txt | grep ${name} | awk -F , {'print $1'} | sed '1d' > /tmp/package.txt

$cloudclient_home/bin/cloudclient.sh vra package export --pkgId $(cat /tmp/package.txt) --path /tmp/${name}
