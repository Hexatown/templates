
. "$PSScriptRoot\.hexatown.com.ps1"                # Load the Hexatown framework
#region Setup - Initial code for hooking you up, you can remove this region once it has runned ...
<#

WELCOME TO HEXATOWN DEAR HEXA CITIZEN !!

Get started

1. Run this script by hitting F5 (Run)
   a. You will be ask to authenticate your self and grant Manage Site permission to Hexatown
   b.
   c.



Regards,
Reach out on Twitter @niegrejoh or using https://www.linkedin.com/in/niels-gregers-johansen/















#>



$hexatown = Start-Hexatown  $myInvocation  "Sites.Manage.All"  @{connectToSharePoint=$false;SkipTranscript=$true}      # Start the framework
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



if ("https://xxxxxxx.sharepoint.com/sites/hexatown" -eq $hexatown.siteUrl){

    write-host "No site specified" -ForegroundColor Yellow

    # GraphRead 

    $rootSite = GraphAPI $hexatown "GET" "https://graph.microsoft.com/v1.0/sites/root"
    
    # write-host "Root site" $rootSite.displayName  $rootSite.webUrl
    

    $sites = GraphAPIAll $hexatown "GET" "https://graph.microsoft.com/v1.0/sites?search="  | Sort-Object -Property displayName # | select webUrl, displayName
    $mySites = @{}
    foreach ($site in $sites)
    {
        $mySites.Add($site.webUrl,$site)
    }
    
    $site = &  "$PSScriptRoot\..\..\pages\select-sharepoint-site.ps1"  $sites
    exit
    if (!$site){
        write-host "No site selected, exiting ..."  -ForegroundColor DarkRed
        exit
    }
        $selectedSite = $mySites.$($site.webUrl)
        write-host "Selected site" $selectedSite.displayName -ForegroundColor Green
        $lists = GraphAPIAll $hexatown "GET" "https://graph.microsoft.com/v1.0/sites/$($selectedSite.id)/lists"  | Sort-Object -Property name

        if ($null -eq ($lists | where {$_.name -eq "Hexatown Log" } )){
            write-host "Creating list for Hexatown Logs" -ForegroundColor Green
            CreateCoreList $hexatown "https://graph.microsoft.com/v1.0/sites/$($selectedSite.id)" (HexatownListLog)
        }
        if ($null -eq ($lists | where {$_.name -eq "Hexatown Properties" } )){
            write-host "Creating list for Hexatown Properties" -ForegroundColor Green
            CreateCoreList $hexatown "https://graph.microsoft.com/v1.0/sites/$($selectedSite.id)" (HexatownListProperties)
        }
        if ($null -eq ($lists | where {$_.name -eq "Hexatown Requests" } )){
            write-host "Creating list for Hexatown Requests" -ForegroundColor Green
            CreateCoreList $hexatown "https://graph.microsoft.com/v1.0/sites/$($selectedSite.id)" (HexatownListRequests)
        }
        
        $lists = GraphAPIAll $hexatown "GET" "https://graph.microsoft.com/v1.0/sites/$($selectedSite.id)/lists"  | Sort-Object -Property name
        start ($lists | where {$_.name -eq "Hexatown Requests" } ).webUrl
    $package = get-content -path (join-path $PSScriptRoot "../../../package.json") | ConvertFrom-Json

    $environmentPath = $env:HEXATOWNHOME
    if ($null -eq $environmentPath ) {
        $environmentPath = ([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::CommonApplicationData)) 
    }
    $path = "$environmentPath/hexatown.com/$($package.name)"

    $envFileName = join-path $path ".env"
    out-file -FilePath $envFileName -InputObject @"
DEVELOP=1
SITEURL=$($site.webUrl)
AADDOMAIN=PROD


"@


        }
##    }

    



#endregion
#region boot
$scope = "Sites.Manage.All"  
$options = @{connectToSharePoint=$true;SkipTranscript=$true}   
$hexatown = Start-Hexatown  $myInvocation $scope $options  # Start the framework
#endregion

write-host "Waiting for request ... "  

while ($true) {                                    ## Loop only need for demo
execute $hexatown requests {                       ## Each unprocessed request will be found and the inline code execute
    Write-Host $request.Title                      ## Put a break point here - note that the current request is found in $request
    #   1/0                                        ## Try to uncomment and see how errors are trapped 
    $endpoint = "https://graph.microsoft.com/v1.0/sites/root"
    return GraphAPI $hexatown "GET"  $endpoint     ## 
 }

Start-Sleep -Seconds 5                             ## Pause 5 secs

}                                                  ## Loop only need for demo

Stop-Hexatown $hexatown                            # Stop the framework       
