Set-AzContext -Subscription "QBU-PM.RD.SBox.MigratorNotesExchange" >$null
$rg = Get-AzVM -ResourceGroupName "ZSMNE"  -Status | Select-Object Name, PowerState
forEach ($vm in $rg){
    if ($rg.PowerState -eq "VM running"){
        Stop-AzVM -resourcegroupname "ZSMNE" -Name $vm.Name
        Write-Output "$($vm.Name) was stopped"
    }
    else {Write-Output "$($vm.Name) already stopped"}
}
