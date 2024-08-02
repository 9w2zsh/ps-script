[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Install-module -name PSWindowsUpdate -force
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll | Out-File "c:\logs\$(get-date -f yyyy-MM-dd)-WindowsUpdate.log" -force