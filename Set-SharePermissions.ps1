Start-Transcript -Path ".\Set-SharePermissions Log.log"
$Sites = Get-Content ".\Group Site List.txt"
$Credentials = (Get-Credential)
$AdminUserName = $Credentials.getNetworkCredential().username
Connect-SPOService -Url https://XXXX-admin.sharepoint.com/ -Credential $Credentials
ForEach ($Site in $Sites) {
    Write-Host "Adding $AdminUserName to Owner For $Site"
    Set-SPOUser -Site $Site -LoginName $AdminUserName -IsSiteCollectionAdmin $true
}
Stop-Transcript