. "$PSScriptRoot\.hexatown.com.ps1"                # Load the Hexatown framework
$hexatown = Start-Hexatown  $myInvocation          # Start the framework


Stop-Hexatown $hexatown                            # Stop the framework       