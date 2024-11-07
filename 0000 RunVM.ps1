Set-AzContext -Subscription "DevTest-BTDTS" >$null

$vmname = Read-Host "`nEnter the LAB name and press [Enter] ..."

#Write-Host "`n**** Run VM ****" -ForegroundColor Green
#if (!($vmname = Read-Host "`nEnter the VM name to RUN and press [Enter]")) { $vmname = "QA365DC1" }

if ($vmname -eq "DEV5MNE3"){
    $rg = "DEV5-RG"
    $vmstat = Get-AzVm -Name $vmname -Status | Select-Object Name, PowerState
    if ($vmstat.PowerState -eq "VM deallocated") {
        Write-Output "Starting $($vmstat.Name)"
        Start-AzVM -Name $vmname -ResourceGroupName $rg
    }
    else { Write-Output "$($vmstat.Name) already running" }
}
elseif ($vmname -eq "QA365D12SSDM2"){
    $rg = "QA365D12-RG"
    $vmstat = Get-AzVm -Name $vmname -Status | Select-Object Name, PowerState
    if ($vmstat.PowerState -eq "VM deallocated") {
        Write-Output "Starting $($vmstat.Name)"
        Start-AzVM -Name $vmname -ResourceGroupName $rg
    }
    else { Write-Output "$($vmstat.Name) already running" }
}
elseif ($vmname -eq "QA365D12BTUSR2"){
    $rg = "QA365D12-RG"
    $vmstat = Get-AzVm -Name $vmname -Status | Select-Object Name, PowerState
    if ($vmstat.PowerState -eq "VM deallocated") {
        Write-Output "Starting $($vmstat.Name)"
        Start-AzVM -Name $vmname -ResourceGroupName $rg
    }
    else { Write-Output "$($vmstat.Name) already running" }
}
elseif ($vmname -eq "QA365BTUSR3"){
    $rg = "QA365-RG"
    $vmstat = Get-AzVm -Name $vmname -Status | Select-Object Name, PowerState
    if ($vmstat.PowerState -eq "VM deallocated") {
        Write-Output "Starting $($vmstat.Name)"
        Start-AzVM -Name $vmname -ResourceGroupName $rg
    }
    else { Write-Output "$($vmstat.Name) already running" }
}

pause