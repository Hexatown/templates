. "$PSScriptRoot\..\..\connectors\NTFSSecurity\index.ps1"

$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
$fileToRun = "$PSScriptRoot\register.ps1"

if (!$isAdmin){
    write-host "Starting PowerShell in admin mode"
    Start-Sleep 2
    $arguments = "-NoExit -file ""$fileToRun `$force `$setupApp `$setupSharePoint"" "
    Start-Process powershell -Verb runas -ArgumentList $arguments
    exit 
}


$package = (Get-Content (join-path $PSScriptRoot "..\..\..\package.json") -raw) | ConvertFrom-Json

$username =  "hexa-$($package.name)"
$passwordInText = "Hex@t0wn"
$jobName = "Hexatown $($package.name)"
#$scriptToRun = "every-day"
#$startAt = "21:00"
#$interval = (New-TimeSpan -Days 1)



function RegisterJob($jobname,$scriptname,$credential,$startAt,$repetitionInterval)
{
     
    $job = Get-ScheduledJob | where {$_.name -eq $jobname}
    if ($null -ne $job){
        Write-Host "Job '$jobname' already registered"
        return
    } 
    

    $trigger1 = New-JobTrigger -Once -At $startAt -RepetitionInterval $repetitionInterval -RepeatIndefinitely 
    $trigger2 = New-JobTrigger -AtStartup -RandomDelay (New-TimeSpan -Minutes 5)
    Register-ScheduledJob -Name $jobname -ArgumentList $psscriptroot,$scriptname  -Trigger $trigger1 ,$trigger2   -ScriptBlock {
        param($psscriptroot,$scriptname)
        . "$psscriptroot\$scriptname.ps1"
    } -Credential $credential 

}




$password = ConvertTo-SecureString $passwordInText  -AsPlainText -Force
$taskRunnerGroupName  =  "Hexatown Task Runners"

if ($username.length -ge 20){
    $username = $username.Substring(0,20)
}



$taskRunnerGroup = (Get-LocalGroup | where {$_.Name -eq $taskRunnerGroupName} )
if ($null -eq $taskRunnerGroup){

    New-LocalGroup -Name $taskRunnerGroupName
}

$taskRunnerUser  = Get-LocalUser | where  {$_.Name -eq $username }
if ($null -eq $taskRunnerUser){
    
    $taskRunnerUser    = New-LocalUser -Name $username -Description "Account used for running tasks"  -PasswordNeverExpires:$true -AccountNeverExpires -UserMayNotChangePassword  -Password $password
    Add-LocalGroupMember -Group  $taskRunnerGroupName  -Member $username
} 

$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $password

RegisterJob "$jobName Daily" "every-day" $credential "21:00" (New-TimeSpan -Days 1) 
RegisterJob "$jobName Hourly" "every-hour" $credential "00:30" (New-TimeSpan -Hour 1) 
RegisterJob "$jobName Minutly" "every-minute" $credential "00:00" (New-TimeSpan -Minute 1)
RegisterJob "$jobName API" "api" $credential "00:00" (New-TimeSpan -Days 1) 
RegisterJob "$jobName Queue Worker" "queue" $credential "00:00" (New-TimeSpan -Days 1) 



$environmentPath = $env:HEXATOWNHOME
if ($null -eq $environmentPath ) {
    $environmentPath = ([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::CommonApplicationData)) 
}

$dataroot = "$environmentPath/hexatown.com/$($package.name)"

$Acl = get-NTFSAccess -Path $dataroot



#"$acl | fl
#exit
Add-NTFSAccess -Path $dataroot -Account $username -AccessRights FullControl
Add-NTFSAccess -Path (Resolve-Path (join-path $psscriptroot "..\..\..")).Path -Account $username -AccessRights ReadAndExecute

