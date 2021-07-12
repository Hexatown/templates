param (
[Parameter(Mandatory=$true)]
$objectID )


$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (!$isAdmin){
    write-host "You need to run this as an administrator" -ForegroundColor Yellow
    exit

}
. "$PSScriptRoot\..\jobs\powershell\.hexatown.com.ps1"
. "$PSScriptRoot\..\connectors\AzureAD\index.ps1"

try 
{ $var = Get-AzureADTenantDetail } 

catch [Microsoft.Open.Azure.AD.CommonLibrary.AadNeedAuthenticationException] 
{ 
 Write-Host "You're not connected."; 
 Connect-AzureAD }

try 
{ $var = Get-AzureADTenantDetail } 

catch [Microsoft.Open.Azure.AD.CommonLibrary.AadNeedAuthenticationException] 
{ Write-Host "You did not connected." -ForegroundColor Yellow
 Exit }

$aadAppsecret01 = New-AzureADApplicationPasswordCredential -ObjectId $objectID -CustomKeyIdentifier "Secret01" -StartDate  (Get-Date).AddDays(-1) -EndDate  (Get-Date).AddDays(180)

return  @{
  secret = $aadAppsecret01
}

