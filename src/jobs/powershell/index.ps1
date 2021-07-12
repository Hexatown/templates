<#
. "$PSScriptRoot\.hexatown.com.ps1"                # Load the Hexatown framework

$hexatown = Start-Hexatown  $myInvocation  "Sites.Manage.All"  @{connectToSharePoint=$false;SkipTranscript=$true}      # Start the framework
   

Stop-Hexatown $hexatown                            # Stop the framework       
#>