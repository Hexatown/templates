param ($force = $false)
. "$PSScriptRoot\.setup.helper.ps1"


$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

$fileToRun = "$PSScriptRoot\renew-app.ps1"



if (!$isAdmin){
    write-host "Starting PowerShell in admin mode"
    Start-Sleep 1
    $arguments = "-NoExit -file ""$fileToRun"""
    write-host $arguments
    
    Start-Process powershell -Verb runas -ArgumentList $arguments
    exit 
}
    

write-host "Renewing Azure AD Application Registration "

get-variable    -Scope Global | where {$_.Name -eq "hexatown"} | Remove-Variable -Scope Global

$environment = GetEnvironmentConfig
<#
if ($null -eq $environment.AADDOMAIN){
    SetEnv $environment "AADDOMAIN"  "Production"
    UpdateEnv $environment

}
#>



if ($null -ne $environment.APPCLIENT_OBJECTID -or $force){
    $authdata = & "$PSScriptRoot\renew-aad-app.ps1" $environment.APPCLIENT_OBJECTID
    SetEnv $environment "APPCLIENT_SECRET"  $authdata.secret.Value 
    
    UpdateEnv $environment

}else{
    write-host "Environment not  configured" -ForegroundColor Yellow
}

