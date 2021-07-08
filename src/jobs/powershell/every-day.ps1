##  Copyright (C) 2020-2021 Niels Gregers Johansen, All Rights reserved.
. "$PSScriptRoot\.hexatown.com.ps1"
$hexatown = Init $MyInvocation $false
# . "$PSScriptRoot\..\..\actions\xxxx.ps1" $hexatown
Stop-Hexatown $hexatown    

