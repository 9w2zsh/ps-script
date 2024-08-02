Write-Host "`n>>> LAB status..." -ForegroundColor Yellow
Write-Host "`nQA365:" -ForegroundColor Green
Get-AzVm -Name QA365DC1 -Status | Select-Object Name, PowerState
Get-AzVm -Name QA365DOM11M -Status | Select-Object Name, PowerState
Get-AzVm -Name QA365MNE1 -Status | Select-Object Name, PowerState
Write-Host "`nQA2019:" -ForegroundColor Green
Get-AzVm -Name QA2019CA1 -Status | Select-Object Name, PowerState
Get-AzVm -Name QA2019DOM9M -Status | Select-Object Name, PowerState
Get-AzVm -Name QA2019DC1 -Status | Select-Object Name, PowerState
Write-Host "`nDEV5" -ForegroundColor Green
Get-AzVm -Name Dev5DC1 -Status | Select-Object Name, PowerState
Get-AzVm -Name Dev5DOM9M -Status | Select-Object Name, PowerState
Get-AzVm -Name Dev5MNE4 -Status | Select-Object Name, PowerState