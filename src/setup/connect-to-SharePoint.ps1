function HexatownListRequests{
return @'
{
    "description":  "Used by the www.hexatown.com framework for requesting a batch process to run ",        
    "displayName":  "Hexatown Requests",
    "list":  {
                 "contentTypesEnabled":  false,
                 "hidden":  false,
                 "template":  "genericList"
             },
    "columns":  [
                    {
                        "columnGroup":  "Custom Columns",
                        "description":  "ID which you can use in your code to relate this request to something",
                        "displayName":  "Your Reference ID",
                        "enforceUniqueValues":  false,
                        "hidden":  false,
                        "indexed":  true,
                        "name":  "YourReferenceID",
                        "readOnly":  true,
                        "required":  false,
                        "text":  {
                                     "allowMultipleLines":  false,
                                     "appendChangesToExistingText":  false,
                                     "linesForEditing":  0,
                                     "maxLength":  255
                                 }
                    },
                    {
                        "columnGroup":  "Custom Columns",
                        "description":  "Here you put a value corresponding with your PowerBricks router logic",
                        "displayName":  "Path",
                        "enforceUniqueValues":  false,
                        "hidden":  false,
                        "indexed":  false,
                        "name":  "Path",
                        "readOnly":  false,
                        "required":  false,
                        "text":  {
                                     "allowMultipleLines":  false,
                                     "appendChangesToExistingText":  false,
                                     "linesForEditing":  0,
                                     "maxLength":  255
                                 }
                    },
                    {
                        "columnGroup":  "Custom Columns",
                        "description":  "Here you put a method, PUT, GET, PATCY, POST, DELETE corresponding to what you like your PowerBricks to do",
                        "displayName":  "Method",
                        "enforceUniqueValues":  false,
                        "hidden":  false,
                        "indexed":  false,
                        "name":  "Method",
                        "readOnly":  false,
                        "required":  false,
                        "text":  {
                                     "allowMultipleLines":  false,
                                     "appendChangesToExistingText":  false,
                                     "linesForEditing":  0,
                                     "maxLength":  255
                                 }
                    },
                    {
                        "columnGroup":  "Custom Columns",
                        "description":  "This is the 'Payload' for the request, it is the logic in the PowerBrick which dictate the format, but it is  typically in a JSON format",
                        "displayName":  "Request",
                        "enforceUniqueValues":  false,
                        "hidden":  false,
                        "indexed":  false,
                        "name":  "Request",
                        "readOnly":  false,
                        "required":  false,
                        "text":  {
                                     "allowMultipleLines":  true,
                                     "appendChangesToExistingText":  false,
                                     "textType": "plain"
                                 }
                    },
                    {
                        "columnGroup":  "Custom Columns",
                        "description":  "This is the a code indicating the process result, following internet REST API standards, so 200 is the value to look for if noting went wrong",
                        "displayName":  "Response Code",
                        "enforceUniqueValues":  false,
                        "hidden":  false,
                        "indexed":  false,
                        "name":  "ResponseCode",
                        "readOnly":  false,
                        "required":  false,
                        "number":  {
                                   "decimalPlaces": "none",
  "displayAs": "number",
  "maximum": 999,
  "minimum": 0
                                 }
                    },
                    {
                        "columnGroup":  "Custom Columns",
                        "description":  "This is the result for of the request, it is the logic in the PowerBrick which dictate the format, but it is  typically in a CSV format for easy consumption in PowerApps",
                        "displayName":  "Response",
                        "enforceUniqueValues":  false,
                        "hidden":  false,
                        "indexed":  false,
                        "name":  "Response",
                        "readOnly":  false,
                        "required":  false,
                        "text":  {
                                     "allowMultipleLines":  true,
                                     "appendChangesToExistingText":  false,
                                                                          "textType": "plain"
                                 }
                    },
                    {
                        "columnGroup":  "Custom Columns",
                        "description":  "Has this been procesed",
                        "displayName":  "Processed",
                        "enforceUniqueValues":  false,
                        "hidden":  false,
                        "indexed":  false,
                        "name":  "Processed",
                        "readOnly":  false,
                        "required":  false,
                        "boolean":  {
                                     
                                 }
                    }

                ]
}

'@
}

function HexatownListLog{
return @'
{
"description":  "Used by the www.hexatown.com framework for logging",    
    "displayName":  "Hexatown Log",
    "list":  {
                 "contentTypesEnabled":  false,
                 "hidden":  false,
                 "template":  "genericList"
             },
    "columns":  [
                    
                    {
                        "columnGroup":  "Custom Columns",
                        "description":  "",
                        "displayName":  "System",
                        "enforceUniqueValues":  false,
                        "hidden":  false,
                        "indexed":  false,
                        "name":  "System",
                        "readOnly":  false,
                        "required":  false,
                        "text":  {
                                     "allowMultipleLines":  false,
                                     "appendChangesToExistingText":  false,
                                     "linesForEditing":  0,
                                     "maxLength":  255
                                 }
                    },
                    {
                        "columnGroup":  "Custom Columns",
                        "description":  "",
                        "displayName":  "Sub System",
                        "enforceUniqueValues":  false,
                        "hidden":  false,
                        "indexed":  false,
                        "name":  "SubSystem",
                        "readOnly":  false,
                        "required":  false,
                        "text":  {
                                     "allowMultipleLines":  false,
                                     "appendChangesToExistingText":  false,
                                     "linesForEditing":  0,
                                     "maxLength":  255
                                 }
                    },
                    {
                        "columnGroup":  "Custom Columns",
                        "description":  "",
                        "displayName":  "Status",
                        "enforceUniqueValues":  false,
                        "hidden":  false,
                        "indexed":  false,
                        "name":  "Status",
                        "readOnly":  false,
                        "required":  false,
                        "text":  {
                                     "allowMultipleLines":  false,
                                     "appendChangesToExistingText":  false,
                                     "linesForEditing":  0,
                                     "maxLength":  255
                                 }
                    },
                    {
                        "columnGroup":  "Custom Columns",
                        "description":  "",
                        "displayName":  "Quantity",
                        "enforceUniqueValues":  false,
                        "hidden":  false,
                        "indexed":  false,
                        "name":  "Quantity",
                        "readOnly":  false,
                        "required":  false,
                        "number":  {
                                       "decimalPlaces":  "none",
                                       "displayAs":  "number",
                                       "maximum":  1.7976931348623157E+308,
                                       "minimum":  -1.7976931348623157E+308
                                   }
                    },
                    {
                        "columnGroup":  "Custom Columns",
                        "description":  "",
                        "displayName":  "System Reference",
                        "enforceUniqueValues":  false,
                        "hidden":  false,
                        "indexed":  false,
                        "name":  "SystemReference",
                        "readOnly":  false,
                        "required":  false,
                        "text":  {
                                     "allowMultipleLines":  false,
                                     "appendChangesToExistingText":  false,
                                     "linesForEditing":  0,
                                     "maxLength":  255
                                 }
                    },
                    {
                        "columnGroup":  "Custom Columns",
                        "description":  "",
                        "displayName":  "Details",
                        "enforceUniqueValues":  false,
                        "hidden":  false,
                        "indexed":  false,
                        "name":  "Details",
                        "readOnly":  false,
                        "required":  false,
                        "text":  {
                                     "allowMultipleLines":  true,
                                     "appendChangesToExistingText":  false,
                                     "linesForEditing":  6,
                                     "textType":  "plain"
                                 }
                    },
                    {
                        "columnGroup":  "Custom Columns",
                        "description":  "",
                        "displayName":  "Host",
                        "enforceUniqueValues":  false,
                        "hidden":  false,
                        "indexed":  false,
                        "name":  "Host",
                        "readOnly":  false,
                        "required":  false,
                        "text":  {
                                     "allowMultipleLines":  false,
                                     "appendChangesToExistingText":  false,
                                     "linesForEditing":  0,
                                     "maxLength":  255
                                 }
                    },
                    {
                        "columnGroup":  "Custom Columns",
                        "description":  "",
                        "displayName":  "Identifier",
                        "enforceUniqueValues":  false,
                        "hidden":  false,
                        "indexed":  false,
                        "name":  "Identifier",
                        "readOnly":  false,
                        "required":  false,
                        "text":  {
                                     "allowMultipleLines":  false,
                                     "appendChangesToExistingText":  false,
                                     "linesForEditing":  0,
                                     "maxLength":  255
                                 }
                    },
                    {
                        "columnGroup":  "Custom Columns",
                        "description":  "",
                        "displayName":  "Workflow",
                        "enforceUniqueValues":  false,
                        "hidden":  false,
                        "indexed":  false,
                        "name":  "Workflow",
                        "readOnly":  false,
                        "required":  false,
                        "text":  {
                                     "allowMultipleLines":  false,
                                     "appendChangesToExistingText":  false,
                                     "linesForEditing":  0,
                                     "maxLength":  255
                                 }
                    },
                    {
                        "columnGroup":  "Custom Columns",
                        "description":  "",
                        "displayName":  "Quantifier",
                        "enforceUniqueValues":  false,
                        "hidden":  false,
                        "indexed":  false,
                        "name":  "Quantifier",
                        "readOnly":  false,
                        "required":  false,
                        "text":  {
                                     "allowMultipleLines":  false,
                                     "appendChangesToExistingText":  false,
                                     "linesForEditing":  0,
                                     "maxLength":  255
                                 }
                    }
                ]
}

'@
}

function HexatownListProperties{
return @'
{
    "description":  "Used by the www.hexatown.com framework for storing key/values",
    "displayName":  "Hexatown Properties",
    "list":  {
                 "contentTypesEnabled":  false,
                 "hidden":  false,
                 "template":  "genericList"
             },
    "columns":  [
                    {
                        "columnGroup":  "Custom Columns",
                        "description":  "",
                        "displayName":  "Value",
                        "enforceUniqueValues":  false,
                        "hidden":  false,
                        "id":  "2f3ccd45-6989-416e-bf9f-2302bcccf089",
                        "indexed":  false,
                        "name":  "Value",
                        "readOnly":  false,
                        "required":  false,
                        "text":  {
                                     "allowMultipleLines":  true,
                                     "appendChangesToExistingText":  false,
                                     "linesForEditing":  6,
                                     "textType":  "plain"
                                 }
                    }
                ]
}


'@
}

function CreateCoreList($hexatown, $siteUrl,$definition) {

    GraphAPI $hexatown POST "$siteUrl/lists" $definition
    

}






    $rootSite = GraphAPI $hexatown "GET" "https://graph.microsoft.com/v1.0/sites/root"
    
    # write-host "Root site" $rootSite.displayName  $rootSite.webUrl
    

    $sites = GraphAPIAll $hexatown "GET" "https://graph.microsoft.com/v1.0/sites?search="  | Sort-Object -Property displayName # | select webUrl, displayName
    $mySites = @{} 
    foreach ($site in $sites)
    {
        $mySites.Add($site.webUrl,$site)
    }
    
    $site = &  "$PSScriptRoot\..\pages\select-sharepoint-site.ps1"  $sites
    
    if (!$site){
        write-host "No site selected, exiting ..."  -ForegroundColor DarkRed
        exit
    }
        $selectedSite = $mySites.$($site.webUrl)
        write-host "Selected site" $selectedSite.displayName -ForegroundColor Green
        $lists = GraphAPIAll $hexatown "GET" "https://graph.microsoft.com/v1.0/sites/$($selectedSite.id)/lists"  | Sort-Object -Property name

        if ($null -eq ($lists | where {$_.name -eq "Hexatown Log" } )){
            write-host "Creating list for Hexatown Logs" -ForegroundColor Green
            CreateCoreList $hexatown "https://graph.microsoft.com/v1.0/sites/$($selectedSite.id)" (HexatownListLog)| Out-Null
        }
        if ($null -eq ($lists | where {$_.name -eq "Hexatown Properties" } )){
            write-host "Creating list for Hexatown Properties" -ForegroundColor Green
            CreateCoreList $hexatown "https://graph.microsoft.com/v1.0/sites/$($selectedSite.id)" (HexatownListProperties)| Out-Null
        }
        if ($null -eq ($lists | where {$_.name -eq "Hexatown Requests" } )){
            write-host "Creating list for Hexatown Requests" -ForegroundColor Green
            CreateCoreList $hexatown "https://graph.microsoft.com/v1.0/sites/$($selectedSite.id)" (HexatownListRequests) | Out-Null
        }
        
        $lists = GraphAPIAll $hexatown "GET" "https://graph.microsoft.com/v1.0/sites/$($selectedSite.id)/lists"  | Sort-Object -Property name



return @{
    siteUrl=$($site.webUrl)

}
