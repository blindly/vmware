$dir = "C:\Users\Administrator\Downloads\VMware_vRealize_CloudClient-4.4.0-5511232\VMware_vRealize_CloudClient-4.4.0-5511232"
$file = "C:\tmp\deployments.csv"
$command = "$dir\bin\cloudclient.bat vra deployment list --allDeployments yes --columns id --format CSV --export $file"
iex $command
if ( Test-Path -path $file ) {

    (Get-Content $file | Select-Object -Skip 1) | Set-Content $file
    $deployments = Get-Content $file

    Foreach ($deployment in $deployments) {
	    write-host $deployment
        if ( $deployment ) {
            $destroy = "$dir\bin\cloudclient.bat vra deployment action execute --action Destroy --id $deployment"
            iex $destroy
        }
    }
}
