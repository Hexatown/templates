param (
[Parameter(Mandatory=$true)]
$hexatown,
$search = "")

. "$PSScriptRoot\..\jobs\powershell\.hexatown.com.ps1"                

GraphAPIAll $hexatown "GET" "https://graph.microsoft.com/v1.0/sites?search=$search"  | Sort-Object -Property displayName # | select webUrl, displayName
   
