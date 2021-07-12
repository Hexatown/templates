param ($force = $false, $setupApp = $true, $setupSharePoint = $true)
. "$PSScriptRoot\.setup.helper.ps1"


$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

$fileToRun = "$PSScriptRoot\index.ps1"

write-host "Setting up" $fileToRun 

if (!$isAdmin){
    write-host "Start PowerShell in admin mode"
    Start-Sleep 1
    $arguments = "-NoExit -file ""$fileToRun `$force `$setupApp `$setupSharePoint"" "
    # write-host $arguments
    
    Start-Process powershell -Verb runas -ArgumentList $arguments
    exit 
}
    # Start-Sleep 10

function SetEnv($environment,$key,$value){
    if ($environment.ContainsKey($key)){
    $environment.$key = $value
    }else{
    $environment.Add($key,$value)
}

}
<#
try
{
    Remove-Variable "hexatown" -Scope Global
}

catch
{
   
}
#>  

get-variable    -Scope Global | where {$_.Name -eq "hexatown"} | Remove-Variable -Scope Global
$environment = GetEnvironmentConfig

if ($setupSharePoint -and ($null -eq $environment.SITEURL -or $force)){
    #& "$PSScriptRoot\setup-site.ps1"  -force $force
    #<#
    $setupScope = "Sites.Manage.All"
    $setupOptions = @{
    connectToSharePoint=$false;
    SkipTranscript=$true} 
    $invocation = @{
        MyCommand  = @{
        Name="Setup"
        Path = (Resolve-Path (join-path $PSScriptRoot "\..\jobs\powershell\index.ps1")).Path
        }
    }
    $hexatown = Start-Hexatown  $invocation $setupScope $setupOptions   # Start the framework
    $sharePointConfig = & "$PSScriptRoot\connect-to-SharePoint.ps1"                                           # Setup the Hexatown framework - Remove this line once done
    SetEnv $environment "SITEURL"  $sharePointConfig.siteUrl
    UpdateEnv $environment
    }else{
        write-host "SharePoint connection already configured"     -ForegroundColor Gray
#>
}



if ($setupApp){
    & "$PSScriptRoot\setup-app.ps1"  -force $force
}
