Set-AzContext -Subscription "QBU-PM.RD.SBox.MigratorNotesExchange"
Get-AzNetworkSecurityGroup -Name "ZSMNE-nsg" -resourcegroupname "ZSMNE" | Get-AzNetworkSecurityRuleConfig -name "RDP_Zainal"

Get-AzNetworkSecurityGroup -Name "Nsg1" -ResourceGroupName "Rg1" | 
Add-AzNetworkSecurityRuleConfig -Name "Rdp-Rule" -Description "Allow RDP" -Access "Allow" -Protocol "Tcp" -Direction "Inbound" -Priority 100 -SourceAddressPrefix "Internet" -SourcePortRange "*" -DestinationAddressPrefix "*" -DestinationPortRange "3389" | 
Set-AzNetworkSecurityGroup


Get-AzNetworkSecurityRuleConfig -Name "RDP_Zainal"