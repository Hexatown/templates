param ($ignoreErrors = $true)
. "$PSScriptRoot\.setup.helper.ps1"

$setupOptions = @{
connectToSharePoint=$false
IgnoreErrors=$ignoreErrors
SkipTranscript=$true} 
$invocation = @{
    MyCommand  = @{
    Name="Setup"
    Path = (Resolve-Path (join-path $PSScriptRoot "\..\jobs\powershell\index.ps1")).Path
    }
}

$loop = $true
$count = 0

do
{
    

try
{
    $hexatown =  Start-HexatownApp  $invocation  $setupOptions 

    if (![string]::IsNullOrEmpty( $hexatown.token)) {
        write-host "Connected" -ForegroundColor Green
        $loop = $false
    }
}

catch [System.Exception]
{   
    $count++
    if ($count -gt 100){
        write-host "" 
        write-host $_ -ForegroundColor Yellow
        $loop = $false
    }else{
        write-host "." -NoNewline
        Start-Sleep -Seconds 2
    }
    #$e = convertfrom-json $_
 
    #Write-Host "Error:"  $e.error -ForegroundColor Yellow
    #Write-Host $e.error_description -ForegroundColor Yellow
}

}
until (!$loop)
