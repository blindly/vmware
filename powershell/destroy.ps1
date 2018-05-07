#########################################################################################
#
# CloudClient  : Cloud Solutions Engineering, Management Business Unit, VMware
# Description  : Destroy deployments
# Date         : May 2018
# Version      : vRA 7.3
#
#########################################################################################
#
# Download the cloud client: https://code.vmware.com/web/dp/tool/cloudclient
# Set the path below
$CloudClient = "C:\Users\Administrator\Downloads\VMware_vRealize_CloudClient-4.4.0-5511232\VMware_vRealize_CloudClient-4.4.0-5511232"
$DeploymentsFile = "C:\tmp\deployments.csv"
$DeploymentsListCommand = "$CloudClient\bin\cloudclient.bat vra deployment list --allDeployments yes --columns id --format CSV --export $DeploymentsFile"
iex $DeploymentsListCommand
if ( Test-Path -path $DeploymentsFile ) {
  (Get-Content $DeploymentsFile | Select-Object -Skip 1) | Set-Content $DeploymentsFile
  $deployments = Get-Content $DeploymentsFile
  Foreach ($deployment in $deployments) {
    write-host "removing deployment: $deployment"
    if ( $deployment ) {
      $DestroyDeploymentCommand = "$dir\bin\cloudclient.bat vra deployment action execute --action Destroy --id $deployment"
      iex $DestroyDeploymentCommand
    }
  }
  Remove-Item $DeploymentsFile
}