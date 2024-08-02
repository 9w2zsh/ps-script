Set-AzContext -Subscription "QBU-PM.RD.SBox.MigratorNotesExchange"
$statuscheck = Get-AzVM -Name "ZSMNEDOM12" -ResourceGroupName "ZSMNE" -Status
if($statuscheck.Statuses.DisplayStatus[1] -ne "VM running")
{
    Write-Output "Starting virtual machine...$($statuscheck.Name)"
    Start-AzVM -Name "ZSMNEDOM12" -ResourceGroupName "ZSMNE"
}
else
{
    Write-output "Virtual machine $($statuscheck.Name) is already in running state"
}