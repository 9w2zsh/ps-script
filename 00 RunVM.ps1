$defdc = "QA365DC1"
$defresgrp = "QA365-RG"
$defvmname = "QA365MNE1"

Write-Host "`n>>> Enter the value and press [Enter] ..." -ForegroundColor Yellow
if (!($dc = Read-Host "DC [$defdc]")) { $dc = $defdc }
if (!($resgrp = Read-Host "Resource Group [$defresgrp]")) { $resgrp = $defresgrp }
if (!($vmname = Read-Host "VM Name [$defvmname]")) { $vmname = $defvmname }

$dcstat = Get-AzVm -Name $dc -Status | Select-Object Name, PowerState
if ($dcstat.PowerState -eq "VM deallocated"){
    Write-Output "` Starting $($dcstat.Name)"
    Start-AzVM -Name $dc -ResourceGroupName $resgrp
}
else {
    Write-Output "` $($dc.Name) already running"
}

$vmstat = Get-AzVm -Name $vmname -Status | Select-Object Name, PowerState
if ($vmstat.PowerState -eq "VM deallocated"){
    Write-Output "` Starting $($vmstat.Name)"
    Start-AzVM -Name $vmname -ResourceGroupName $resgrp
}
else {
    Write-Output "` $($vmname.Name) already running"
}
