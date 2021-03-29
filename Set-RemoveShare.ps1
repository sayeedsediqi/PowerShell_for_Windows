Start-Transcript -Path ".\Set-RemoveShare Log.log"
foreach ($User in (import-csv ".\Group Share Table.csv")) {
    $SamAccountName = $User.SamAccountName
    $Share = "$SamAccountName$"
    Remove-SmbShare -Name $Share -confirm:$false -Verbose
}
Stop-Transcript