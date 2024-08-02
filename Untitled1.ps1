$ips="121.121.119.118"
$nsgName = "ZSMNE-nsg"
$rscgrpName = "ZSMNE"
$ruleName = "RDP_Zainal"

Set-AzContext -Subscription "QBU-PM.RD.SBox.MigratorNotesExchange"
$nsg = Get-AzNetworkSecurityGroup -Name $nsgName -ResourceGroupName $rscgrpName
$rule = $nsg | Get-AzNetworkSecurityRuleConfig -Name $rule_name 

Set-AzNetworkSecurityRuleConfig -NetworkSecurityGroup $nsg `
     -Name $rule_name `
     -Access $rule.Access `
     -Protocol $rule.Protocol `
     -Direction $rule.Direction `
     -Priority $rule.Priority `
     -SourceAddressPrefix $ips `
     -SourcePortRange $rule.SourcePortRange `
     -DestinationAddressPrefix $rule.DestinationAddressPrefix `
     -DestinationPortRange $rule.DestinationPortRange `
     -Description $rule.Description

 $nsg | Set-AzNetworkSecurityGroup