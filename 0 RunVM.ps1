#Connect-AzAccount -Subscription "DevTest-BTDTS" >$null
Set-AzContext -Subscription "DevTest-BTDTS" >$null

Write-Host "`n>>> Enter the LAB name to RUN and press [Enter] ..." -ForegroundColor Green
if (!($lab = Read-Host "1: [QA365], `n2: [QA365D12], `n3: [QA2019], `nEnter number:")) { $lab = "1" }

if ($lab -eq "1") {
    $rg = "QA365-RG"
    $dc = "QA365DC1"
    $vms = Get-AzVM -ResourceGroupName $rg
    $dcstat = Get-AzVM -Name $dc -Status | Select-Object Name, PowerState
    if ($dcstat.PowerState -eq "VM deallocated") {
        Write-Output "`nStarting $($dc)"
        Start-AzVM -Name $dc -ResourceGroupName $rg -NoWait
    }
    else { Write-Output "`n$($dc) already running" }
}
elseif ($lab -eq "2") {
    $rg = "QA365D12-RG"
    $dc = "QA365D12DC1"
    $vms = Get-AzVM -ResourceGroupName $rg
    $dcstat = Get-AzVM -Name $dc -Status | Select-Object Name, PowerState
    if ($dcstat.PowerState -eq "VM deallocated") {
        Write-Output "`nStarting $($dc)"
        Start-AzVM -Name $dc -ResourceGroupName $rg -NoWait
    }
    else { Write-Output "`n$($dc) already running" }
}
elseif ($lab -eq "3") {
    $rg = "QA2019-RG"
    $dc = "QA2019DC1"
    $vms = Get-AzVM -ResourceGroupName $rg
    $dcstat = Get-AzVM -Name $dc -Status | Select-Object Name, PowerState
    if ($dcstat.PowerState -eq "VM deallocated") {
        Write-Output "`nStarting $($dc)"
        Start-AzVM -Name $dc -ResourceGroupName $rg -NoWait
    }
    else { Write-Output "`n$($dc) already running" }
}
else { Write-Output "`nLab not found, pls check lab name"; pause; return }
    
foreach ($vm in $vms) {
    $vmname = Get-AzVM -Name $vm.Name -Status | Select-Object Name, PowerState
    if ($vmname.PowerState -eq "VM deallocated") {
        Write-Output "`n$($vm.Name), $($vmname.PowerState)"
        if (!($runvm = Read-Host "Run VM?: ")) { $runvm = "N" }
        if ($runvm -eq "Y"){
            Write-Output "Starting $($vm.Name)"
            Start-AzVM -Name $vm.Name -ResourceGroupName $rg -NoWait
        }
    }
    else { Write-Output "`n$($vm.Name) already running" }
}

Pause
