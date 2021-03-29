Start-Transcript -Path ".\Set-ShareDisabled Log.log"
foreach ($User in (import-csv ".\Group Share Table.csv")) {
    $SharePath = $User.SharePath
    $ACL = Get-Acl $SharePath
    $ACL.setAccessRule((New-Object System.Security.AccessControl.FileSystemAccessRule($User.SamAccountName, "read", "ContainerInherit,ObjectInherit", "none", "deny")))
    Set-Acl $SharePath $ACL -verbose
}
Stop-Transcript