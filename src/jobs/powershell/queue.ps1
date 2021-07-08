##  Copyright (C) 2020-2021 Niels Gregers Johansen, All Rights reserved.
<#
. "$PSScriptRoot\.hexatown.com.ps1"
do
{
$hexatown = Init $MyInvocation $false
. "$PSScriptRoot\..\..\actions\Get-QueueEvents.ps1" $hexatown
Stop-Hexatown $hexatown    
}
while ($true)
#>