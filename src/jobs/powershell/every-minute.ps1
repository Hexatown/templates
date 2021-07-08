##  Copyright (C) 2020-2021 Niels Gregers Johansen, All Rights reserved.

. "$PSScriptRoot\.hexatown.com.ps1"
   $hexatown = Init $MyInvocation 
     
. "$psscriptroot\..\..\actions\xxxxxxx.ps1" $hexatown

. "$psscriptroot\stop.ps1" $hexatown
