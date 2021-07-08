##
# Credit to https://adamtheautomator.com/exchange-online-v2/#Creating_an_Azure_AD_Application_with_API_Permissions
##
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



$packageName = (Get-Content "$PSScriptRoot\..\..\package.json" | ConvertFrom-Json).name

$appName = "Hexatown-$packageName"


## Get the Microsoft Graph API details.
$api2 = (Get-AzureADServicePrincipal -Filter "AppID eq '00000003-0000-0000-c000-000000000000'")

## Get the API permission ID
$permission2 = $api2.AppRoles | Where-Object { $_.Value -eq 'Sites.Manage.All' }

## Build the API permission object (TYPE: Role = Application, Scope = User)
$apiPermission2 = [Microsoft.Open.AzureAD.Model.RequiredResourceAccess]@{
    ResourceAppId  = $api2.AppId ;
    ResourceAccess = [Microsoft.Open.AzureAD.Model.ResourceAccess]@{
        Id   = $permission2.Id ;
        Type = "Role"
    }
}


## Register the new Azure AD App with API Permissions
$myApp = New-AzureADApplication -DisplayName $appName -ReplyUrls 'https://www.jumpto365.com/thanks' -RequiredResourceAccess $apiPermission2 

## Enable the Service Principal
# $mySP = New-AzureADServicePrincipal -AppID $myApp.AppID

$startDate = Get-Date
$endDate = $startDate.AddYears(1)
$aadAppsecret01 = New-AzureADApplicationPasswordCredential -ObjectId $myApp.ObjectID -CustomKeyIdentifier "Secret01" -EndDate $endDate # -StartDate $startDate 

$tenantID = (Get-AzureADTenantDetail).ObjectID

$domainName = $null
foreach ($domain in get-azureaddomain )
{
    if ($domain.Name.EndsWith(".onmicrosoft.com") -and $false -eq $domain.Name.Contains(".mail.onmicrosoft.com")){
        $domainName = $domain.Name
    }
    
}


return  @{

   consentUrl = "https://login.microsoftonline.com/$tenantID/adminconsent?client_id=$($myApp.AppID)"
   tenantID = $tenantID
   appID =$myApp.AppID
   domainName=$domainName
   secret = $aadAppsecret01
}

