Set-AzContext -Subscription "DevTest-BTDTS"
$vmlist = Get-AzVm -ResourceGroupName DEV5-RG -Status | Select-Object Name, PowerState
foreach($vm in $vmlist){
    if($vm.PowerState -eq "VM running"){
        Write-Output "$($vm.Name), $($vm.PowerState)"
    }
}