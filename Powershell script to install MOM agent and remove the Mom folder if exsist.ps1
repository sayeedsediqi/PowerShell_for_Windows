$ServerList = "c:\Servers\Servers.2008.txt"
$Servers = Get-Content $ServerList

foreach ($server in $Servers)
{
    # Create Folders & Copy files ONLY if they are not there.
    if (Test-Path "\\$server\C$\Windows\scripts") {}
    Else {new-item -type Directory -path "\\$server\C$\Windows\scripts" -force -erroraction SilentlyContinue}
    
    if (Test-Path "\\$server\C$\Windows\scripts\Mom") {}
    Else {new-item -type Directory -path "\\$server\C$\Windows\scripts\Mom" -force -erroraction SilentlyContinue}
    
    if (Test-Path "\\$server\C$\Windows\scripts\Mom\2020-11") {}
    Else {new-item -type Directory -path "\\$server\C$\Windows\scripts\Mom\2020-11" -force -erroraction SilentlyContinue}
    
    if (Test-Path "\\$server\c$\windows\scripts\MOM\2020-11\MMASetup-AMD64.bat") {}
    Else {copy-item "\\xxxxxx\it_softlib\Azure Log Analytics OMS MOM Agent\2008\2020-11_update\MMASetup-AMD64.bat" -destination "\\$server\c$\windows\scripts\MOM\2020-11\MMASetup-AMD64.bat" -force -erroraction SilentlyContinue}

    if (Test-Path "\\$server\c$\windows\scripts\MOM\2020-11\MMASetup-AMD64.exe") {}
    Else {copy-item "\\xxxxxx\it_softlib\Azure Log Analytics OMS MOM Agent\2008\2020-11_update\MMASetup-AMD64.exe" -destination "\\$server\c$\windows\scripts\MOM\2020-11\MMASetup-AMD64.exe" -force -erroraction SilentlyContinue}
    
    if (Test-Path "\\$server\c$\windows\scripts\MOM\2020-11\MOM_Agent_TLS1.2_Enable.reg") {}
    Else {copy-item "\\xxxxxx\it_softlib\Azure Log Analytics OMS MOM Agent\2008\2020-11_update\MOM_Agent_TLS1.2_Enable.reg" -destination "\\$server\c$\windows\scripts\MOM\2020-11\MOM_Agent_TLS1.2_Enable.reg" -force -erroraction SilentlyContinue}


    # Remote Re-install of agent
    Invoke-Command -ComputerName $server -ScriptBlock {
        #### CLEAN
        Get-package "Microsoft Monitoring Agent" | Uninstall-Package  -ErrorAction SilentlyContinue
        remove-item -path "C:\Program Files\Microsoft Monitoring Agent" -Force -Recurse -ErrorAction SilentlyContinue
    
        #### RE-INSALL
        Invoke-Expression -Command:"cmd.exe /c 'C:\Windows\scripts\Mom\2020-11\MMASetup-AMD64.bat'"
   }
}
