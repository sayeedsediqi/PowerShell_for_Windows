   Param
    (
        [Parameter (Mandatory = $true)]
        [String] $sharepointsiteName,

        [Parameter (Mandatory = $true)]
        [String] $SiteAlias,

        [Parameter (Mandatory = $false)]
        [String] $Email = "xxxx.sss@mydomain.com",

        [Parameter (Mandatory = $false)]
        [String] $RequestedclientEmail = "xxxx.sss@mydomain.com"
    )
    Send-MailMessage -from Azure.Automation@mydomain.ca-to "$email" -Subject "creating sharepoint site: $sharepointsiteName for: $RequestedclientEmail"  -SmtpServer xxxx.mydoamin.xxxx
$AdminUrl = "https://xxxx-admin.sharepoint.com/"
$baseUrl = "https://xxxx.sharepoint.com"
$ManagedPath = "/sites/"
$SiteCollectionAdmin = "xxxx.sss@mydomain.com"

#End of Config Section

$ErrorActionPreference = "stop"

$Credentials = Get-AutomationPSCredential -Name 'sharepointadmin'
Connect-PnPOnline -Url $AdminUrl -credential $Credentials

# Create a new modern team site
 $teamsiteURL = New-PnPSite -Type Team -Title $sharepointsiteName -Description $SiteAlias -Alias $SiteAlias -Lcid 1033 
Start-Sleep -s 90

#Config Section
$AdminUrl = "https://xxxx-admin.sharepoint.com/"
$siteUrl = $baseUrl + $ManagedPath + $sharepointsiteName
Write-Host Site Url $Siteurl
$SiteMembers =    "xxxx.sss@mydomain.com" 
connect-exchangeonline -Credential $Credentials 
Get-UnifiedGroup -Identity $SiteAlias | set-unifiedgroup -hiddenfromAddresslistenabled $true
Send-MailMessage -from Azure.Automation@mydomain.ca -to "$RequestedclientEmail" -Subject "your sharepoint site $sharepointsite is ready" -body $teamsiteURL -SmtpServer xxxx.mydoamin.xxxx
