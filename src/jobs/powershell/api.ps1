##  Copyright (C) 2020-2021 Niels Gregers Johansen, All Rights reserved.
. "$PSScriptRoot\.hexatown.com.ps1"
do
{
 . "$PSScriptRoot\start.ps1"
    Serve $hexatown 
    . "$PSScriptRoot\stop.ps1"
}
while ($true)
