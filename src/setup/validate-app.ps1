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
try
{
$hexatown =  Start-HexatownApp  $invocation  $setupOptions 
if (![string]::IsNullOrEmpty( $hexatown.token)) {
write-host "Connected" -ForegroundColor Green

}
}

catch [System.Exception]
{   
write-host $_ -ForegroundColor Yellow
    #$e = convertfrom-json $_
 
    #Write-Host "Error:"  $e.error -ForegroundColor Yellow
    #Write-Host $e.error_description -ForegroundColor Yellow
}
