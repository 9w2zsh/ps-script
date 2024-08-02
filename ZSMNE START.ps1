Set-AzContext -Subscription "QBU-PM.RD.SBox.MigratorNotesExchange"
Start-AzVM -name "ZSMNEDC" -ResourceGroupName "ZSMNE"
Start-AzVM -name "ZSMNECON" -ResourceGroupName "ZSMNE"
Start-AzVM -name "ZSMNEDOM12" -ResourceGroupName "ZSMNE"
pause