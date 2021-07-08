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

$hexatown = Start-HexatownApp  $invocation  $setupOptions   # Start the framework


$listTemplatePath= join-path $PSScriptRoot "..\templates\lists"
   
$listInstances = GraphAPIAll $hexatown "GET" "$($hexatown.site)/lists"
    
EnsurePath "$listTemplatePath\export"

$listDictionary = @{}
foreach ($listInstance in $listInstances)
{
$listDictionary.Add($listInstance.id,$listInstance.name)
}

foreach ($listInstance in $listInstances)
{
    write-host $listInstance.name # $listInstance
    $columnDefinitions = RemoveStandardSharePointElements (GraphAPIAll $hexatown "GET" "$($hexatown.site)/lists/$($listInstance.name)/columns")
    foreach ($columnDefinition in $columnDefinitions)
    {
        # $columnDefinition.PSObject.Properties.Remove("id")
        $x = $columnDefinition.PSObject.Properties
        if ($null -ne $columnDefinition.lookup){
            if ($listDictionary.ContainsKey($columnDefinition.lookup.listId)){
                $tableName = $listDictionary.$($columnDefinition.lookup.listId)
                $columnDefinition.lookup.listId = $tableName
            }
        }
        
    }
    if ($null -eq $columnDefinitions.Count) {
        $columnDefinitions = @($columnDefinitions)
    }

    $listDefinition  = @{
      "description"= $listInstance.description
  "displayName" = $listInstance.displayName
  "list" =  @{
    "contentTypesEnabled" =  $false
    "hidden" = $false
    "template" = "genericList"
   
  }
   "columns" = $columnDefinitions
  }

   Out-File -LiteralPath "$listTemplatePath\export\$($listInstance.name).json" -InputObject ($listDefinition | convertto-json -Depth 10)
    
}

