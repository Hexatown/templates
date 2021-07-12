param ($search = "")

. "$PSScriptRoot\..\jobs\powershell\.hexatown.com.ps1"                # Load the Hexatown framework
$hexatown = Start-Hexatown  $myInvocation  "Sites.Manage.All"  @{connectToSharePoint=$false;SkipTranscript=$true}      # Start the framework

GraphAPIAll $hexatown "GET" "https://graph.microsoft.com/v1.0/sites?search=$search"  | Sort-Object -Property displayName # | select webUrl, displayName
  

Stop-Hexatown $hexatown                            # Stop the framework       
