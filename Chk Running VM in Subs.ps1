$subs = Get-AzSubscription | Where-Object {$_.Name -in ("DevTest-BTDTS","QBU-PM.RD.SBox.MMAD","QBU-PM.RD.SBox.MigratorNotesExchange")}
foreach ($sub in $subs) {
    $subname = $sub.Name
    Set-AzContext -Subscription $subname | Out-Null
    $rgs = Get-AzResourceGroup
    foreach ($rg in $rgs) {
        $vms = Get-AzVM -ResourceGroupName $rg.resourcegroupname
        foreach ($vm in $vms) {
            $vmstatus = Get-AzVM -Status | Select-Object Name, PowerState 
            if ($vmstatus.PowerState -eq "VM running") {
                Write-Output "`n$($vmstatus.Name),$($vmstatus.PowerState)"
            }
            
        }
    }
}