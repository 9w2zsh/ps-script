$deflab = "QA365"
$defvm = "QA365MNE1"
Set-AzContext -Subscription "DevTest-BTDTS" >$null

if (!($lab = Read-Host "`nEnter the LAB name and press [Enter] ...")) { $lab = $deflab }
Write-Host "`nList of VMs in this lab:" -ForegroundColor Yellow

if ($lab -eq "QA365"){
    $rg = "QA365-RG"
    $vms = Get-AzVM -ResourceGroupName $rg -Status | Select-Object Name, PowerState
    foreach ($vm in $vms) {
        Write-Output "$($vm.Name)`t$($vm.PowerState)"
    }
}
elseif ($lab -eq "QA365D12"){
    $rg = "QA365D12-RG"
    $vms = Get-AzVM -ResourceGroupName $rg -Status | Select-Object Name, PowerState
    foreach ($vm in $vms) {
        Write-Output "$($vm.Name)`t$($vm.PowerState)"
    }
}
elseif ($lab -eq "DEV5"){
    $rg = "DEV5-RG"
    $vms = Get-AzVM -ResourceGroupName $rg -Status | Select-Object Name, PowerState
    foreach ($vm in $vms) {
        Write-Output "$($vm.Name)`t$($vm.PowerState)"
    }
}
elseif ($lab -eq "ZSMNE"){
    Set-AzContext -Subscription "QBU-PM.RD.SBox.MigratorNotesExchange" >$null
    $rg = "ZSMNE"
    $vms = Get-AzVM -ResourceGroupName $rg -Status | Select-Object Name, PowerState
    foreach ($vm in $vms) {
        Write-Output "$($vm.Name)`t$($vm.PowerState)"
    }
}
elseif ($lab -eq "ZSJUMBOX"){
    Set-AzContext -Subscription "QBU-PM.RD.SBox.MMAD" >$null
    $rg = "ZS"
    $vms = Get-AzVM -ResourceGroupName $rg -Status | Select-Object Name, PowerState
    foreach ($vm in $vms) {
        Write-Output "$($vm.Name)`t$($vm.PowerState)"
    }
}

if (!($vm2run = Read-Host "`nEnter the VM to RUN and press [Enter] ...")) { $vm2run = $defvm }

if ($vm2run -ne ""){
$vm2runstat = Get-AzVm -Name $vm2run -Status | Select-Object Name, PowerState
if ($vm2runstat.PowerState -eq "VM deallocated"){
    Write-Output "`nStarting $($vm2runstat.Name)"
    Start-AzVM -Name $vm2run -ResourceGroupName $rg
}
else {Write-Output "`n$($vm2runstat.Name) already running"}
}
Write-Output "`n`n**END OF TASK**"
pause