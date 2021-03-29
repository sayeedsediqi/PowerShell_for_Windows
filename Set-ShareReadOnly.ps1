Start-Transcript -Path ".\Set-ShareReadOnly Log.log"
foreach ($User in (import-csv ".\Group Share Table.csv")) {
    $SharePath = $User.SharePath
    $ACL = Get-Acl $SharePath
    $ACL.setAccessRule((New-Object System.Security.AccessControl.FileSystemAccessRule($User.SamAccountName, "Read", "ContainerInherit,ObjectInherit", "none", "allow")))
    Set-Acl $SharePath $ACL -verbose
}
Stop-Transcript