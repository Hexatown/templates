param ($force = $false)
. "$PSScriptRoot\.setup.helper.ps1"


$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

$fileToRun = "$PSScriptRoot\setup-app.ps1"



if (!$isAdmin){
    write-host "Starting PowerShell in admin mode"
    Start-Sleep 1
    $arguments = "-NoExit -file ""$fileToRun"""
    write-host $arguments
    
    Start-Process powershell -Verb runas -ArgumentList $arguments
    exit 
}
    

write-host "Creating Azure AD Application Registration "

get-variable    -Scope Global | where {$_.Name -eq "hexatown"} | Remove-Variable -Scope Global

$environment = GetEnvironmentConfig
if ($null -eq $environment.AADDOMAIN){
    SetEnv $environment "AADDOMAIN"  "Production"
    UpdateEnv $environment

}




if ($null -eq $environment.APPCLIENT_ID -or $force){
    $authdata = & "$PSScriptRoot\create-aad-app.ps1"
    SetEnv $environment "APPCLIENT_ID"  $authdata.appID
    SetEnv $environment "APPCLIENT_SECRET"  $authdata.secret.Value
    SetEnv $environment "APPCLIENT_DOMAIN"  $authdata.tenantID
    
    UpdateEnv $environment

    Set-Clipboard -Value $authdata.consentUrl
    write-host "Ask your Global Admin to open this link"
    write-host ""
    write-host $authdata.consentUrl
    Write-Host ""
    write-host "URL has been copied to the clipboard"
}else{
    write-host "Environment already configured" -ForegroundColor Yellow
}

