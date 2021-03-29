    #purge emails
Connect-IPPSSession -Credential $UserCredential -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/./
    New-ComplianceSearchAction -SearchName 93729 -Purgetype HardDelete -Purge -force

    New-ComplianceSearchAction -SearchName 93729 -Purgetype HardDelete -Purge -force

    $recipient=read-host -prompt "Please enter recipient email address"
Get-MessageTrace  -recipient  "$recipient"  -startdate (get-date).addminutes(-360) -enddate (get-date)
