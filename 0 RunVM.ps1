$resgrp = "QA365-RG"
$vmname = "QA365BTUSR1"
$vmstat = Get-AzVm -Name $vmname -Status | Select-Object Name, PowerState

if ($vmstat.PowerState -eq "VM deallocated"){
    Write-Output "` ` Starting $($vmstat.Name)"
    Start-AzVM -name $vmname -ResourceGroupName $resgrp
}
else {
    Write-Output "` ` $($vmstat.Name) already running"
}