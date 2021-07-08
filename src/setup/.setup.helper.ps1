. "$PSScriptRoot\..\jobs\powershell\.hexatown.com.ps1"

function GetEnvironmentPath(){

$filename = join-path ($psscriptRoot) "../../package.json"
$debug = 0
if (!(Test-Path $filename)){
    write-host "No PowerBrick found" -ForegroundColor Yellow
    return
}


$package = Get-Content $filename | ConvertFrom-Json

 
$environmentPath = $env:HEXATOWNHOME
if ($null -eq $environmentPath ) {
$environmentPath = join-path ([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::CommonApplicationData)) "hexatown.com"
}



$envfilepath = join-path $environmentPath $package.name
return $envfilepath 

}

function GetEnvironmentConfig($alternateName){
$envFilePath = Join-Path (GetEnvironmentPath) "$alternateName.env"
if(!(Test-Path $envFilePath     )){

return @{}   
    
}
$lines = Get-Content ($envFilePath)
$envvalue = @{}             
foreach ($line in $lines) {
                    
    $nameValuePair = $line.split("=")
    if ($nameValuePair[0] -ne "") {
        if ($debug) {
            write-host "Setting >$($nameValuePair[0])<"
        }
        $value = $nameValuePair[1]
                    
        for ($i = 2; $i -lt $nameValuePair.Count; $i++) {
            $value += "="
            $value += $nameValuePair[$i]
        }

        if ($debug) {
            write-host "To >$value<"
        }    
         
        $envvalue.Add($nameValuePair[0], $value)
    }
}


return $envvalue
}


function UpdateEnv($env,$alternateName){
$envPath = GetEnvironmentPath
EnsurePath $envPath
$envFilePath = Join-Path $envPath "$alternateName.env"


$data =""
foreach ($key in $env.keys | Sort-Object )
{
    $e = $env.$key
    $data += "$($key)=$($e)`r`n"
    
}
    
out-file -FilePath $envFilePath -InputObject $data

}



function SetEnv($environment,$key,$value){
    if ($environment.ContainsKey($key)){
    $environment.$key = $value
    }else{
    $environment.Add($key,$value)
}

}
