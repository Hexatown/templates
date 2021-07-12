. "$PSScriptRoot\.setup.helper.ps1"




$setupOptions = @{
connectToSharePoint=$true
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
$hexatown = Start-HexatownApp  $invocation  $setupOptions   # Start the framework
}

catch [System.Net.WebException],[System.Exception]
{
    Write-Host $_ -ForegroundColor Red

}
if ($null -eq $hexatown){
    return
}




function CreateList($hexatown, $siteUrl,$definition) {

    GraphAPI $hexatown POST "$siteUrl/lists" $definition
    

}

$listTemplatePath= join-path $PSScriptRoot "..\templates\lists"
$listTemplates = Get-ChildItem -Path "$listTemplatePath\*.json" | select Name


write-host "Creating list"
do
{
    

$hasMore = $false

$listInstances = GraphAPIAll $hexatown "GET" "$($hexatown.site)/lists"
$listDictionary = @{}
foreach ($listInstance in $listInstances)
{
$listDictionary.Add($listInstance.name,$listInstance.id)
}

foreach ($listTemplate in $listTemplates)
{
    $name = $listTemplate.Name.Replace(".json","")
    
    $listInstance = GraphAPI $hexatown "GET" "$($hexatown.site)/lists/$name" $null $true
    if ($null -eq $listInstance ){
        
        $definition = Get-Content -Path "$listTemplatePath\$name.json" | ConvertFrom-Json
        $skip = $false
        foreach ($columnDefinition in $definition.columns)
        {

            if ($null -ne $columnDefinition.lookup){
                if ($listDictionary.ContainsKey($columnDefinition.lookup.listId)){
                    $tableId = $listDictionary.$($columnDefinition.lookup.listId)
                    $columnDefinition.lookup.listId = $tableId
                }else
                {
                $skip = $true
                }
            }
        
        }
        if ($skip){
        write-host "Waiting for reference " $name -ForegroundColor yellow
        $hasMore = $true
        }
        else{
        write-host Creating $name -ForegroundColor Green
        $list = CreateList $hexatown $hexatown.site  ($definition | ConvertTo-Json -Depth 10)
        
        }
    }else{
#    write-host $name exists -ForegroundColor Gray
}
}
}
while ($hasMore)


