param (
[Parameter(Mandatory=$true)]
$sharePointUrl )
. "$PSScriptRoot\.setup.helper.ps1"
$environment = GetEnvironmentConfig
if ($null -eq $environment.APPCLIENT_ID){

    throw "Cannot setup SharePoint unless environment has been setup with an Application Identity " 
    

}
    
SetEnv $environment "SITEURL"  $sharePointUrl
UpdateEnv $environment



$setupOptions = @{
connectToSharePoint=$true
IgnoreErrors=$ignoreErrors
SkipTranscript=$true} 
$invocation = @{
    MyCommand  = @{
    Name="Setup"
    Path = (Resolve-Path (join-path $PSScriptRoot "\..\jobs\powershell\index.ps1")).Path
    }
}

$hexatown = Start-HexatownApp  $invocation  $setupOptions   # Start the framework
$siteInfo = GraphAPI $hexatown GET $hexatown.site 

if ($null -ne $siteInfo){
    write-host "GREAT !!! " -ForegroundColor Green
    write-host "You have access to SharePoint site with name ""$($siteInfo.displayName)""" -ForegroundColor Green

}


