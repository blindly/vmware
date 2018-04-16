$CloudClient = "C:\Users\Administrator\Downloads\VMware_vRealize_CloudClient-4.4.0-5511232\VMware_vRealize_CloudClient-4.4.0-5511232"
$command = "$CloudClient\bin\cloudclient.bat vra deployment list --columns id --format CSV --export C:\deployments.csv"
iex $command
$deployments = Get-Content C:\tmp\deployments.csv

Foreach ($deployment in $deployments) {
	write-host $deployment
    if ( $deployment ) {
      $destroy = "$dir\bin\cloudclient.bat vra deployment action execute --action Destroy --id $deployment"
      iex $destroy
    }
}