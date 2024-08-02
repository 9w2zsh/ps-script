Set-AzContext -Subscription "QBU-PM.RD.SBox.MMAD"
Start-AzVM -name "ZSjumbox" -ResourceGroupName "ZS"
Write-Host 'ZSjumbox has been started' -ForegroundColor Cyan
