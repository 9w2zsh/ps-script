$deflab = "QA365"
Set-AzContext -Subscription "DevTest-BTDTS"

Write-Host "`n>>> Enter the LAB name to RUN and press [Enter] ..." -ForegroundColor Yellow
if (!($lab = Read-Host "Lab [$deflab], [QA365D12], [QA2016], [QA2019], [DEV5], [ZSMNE], [JUMBOX]")) { $lab = $deflab }

if ($lab -eq "DEV5"){
    $rg = "DEV5-RG"
    $dc = "Dev5DC1"
    $dom = "Dev5DOM9M"
    $mne1 = "Dev5MNE4"
    $mne2 = ""
    $exch = ""
}
elseif ($lab -eq "QA2016"){
    $rg = "QA2016-RG"
    $dc = "QA2016DC1"
    $dom = "QA2016DOM9M"
    $mne1 = "QA2016CA1"
    $mne2 = ""
    $exch = "QA2016EXCH1"
}
elseif ($lab -eq "QA2019"){
    $rg = "QA2019-RG"
    $dc = "QA2019DC1"
    $dom = "QA2019DOM9M"
    $mne1 = "QA2019CA1"
    $mne2 = "QA2019SQL1"
    $exch = "QA2019EXCH2"
}
elseif ($lab -eq "QA365"){
    $rg = "QA365-RG"
    $dc = "QA365DC1"
    $dom = "QA365DOM11M"
    $mne1 = "QA365MNE1"
    $mne2 = "QA365MNE3"
    $exch = ""
}
elseif ($lab -eq "QA365D12"){
    $rg = "QA365D12-RG"
    $dc = "QA365D12DC1"
    $dom = "QA365D12DOM12M"
    $mne1 = "QA365D12MNE1"
    $mne2 = ""
    $exch = ""
}
elseif ($lab -eq "ZSMNE"){
    $rg = "ZSMNE"
    $dc = "ZSMNEDC"
    $dom = "ZSMNEDOM12"
    $mne1 = "ZSMNECON"
    $mne2 = ""
    $exch = ""
    Set-AzContext -Subscription "QBU-PM.RD.SBox.MigratorNotesExchange" >$null
}
elseif ($lab -eq "JUMBOX"){
    $rg = "ZS"
    $dc = ""
    $dom = ""
    $mne1 = "ZSjumbox"
    $mne2 = ""
    $exch = ""
    Set-AzContext -Subscription "QBU-PM.RD.SBox.MMAD" >$null
}
else {Write-Output "`nLab not found, pls check lab name"; pause; return}

if ($dc -ne ""){
$dcstat = Get-AzVm -Name $dc -Status | Select-Object Name, PowerState
if ($dcstat.PowerState -eq "VM deallocated"){
    Write-Output "`nStarting $($dcstat.Name)"
    Start-AzVM -Name $dc -ResourceGroupName $rg
}
else {Write-Output "`n$($dcstat.Name) already running"}
}

if ($dom -ne ""){
$domstat = Get-AzVm -Name $dom -Status | Select-Object Name, PowerState
if ($domstat.PowerState -eq "VM deallocated"){
    Write-Output "Starting $($domstat.Name)"
    Start-AzVM -Name $dom -ResourceGroupName $rg
}
else {Write-Output "$($domstat.Name) already running"}
}

if ($mne1 -ne ""){
$vmstat = Get-AzVm -Name $mne1 -Status | Select-Object Name, PowerState
if ($vmstat.PowerState -eq "VM deallocated"){
    Write-Output "Starting $($vmstat.Name)"
    Start-AzVM -Name $mne1 -ResourceGroupName $rg
}
else {Write-Output "$($vmstat.Name) already running"}
}

if ($exch -ne ""){
    $exchstat = Get-AzVm -Name $exch -Status | Select-Object Name, PowerState
    if ($exchstat.PowerState -eq "VM deallocated"){
        Write-Output "Starting $($exchstat.Name)"
        Start-AzVM -Name $exch -ResourceGroupName $rg
    }
    else {Write-Output "$($exchstat.Name) already running"}
}

if ($mne2 -ne ""){
    $mne2stat = Get-AzVm -Name $mne2 -Status | Select-Object Name, PowerState
    if ($mne2stat.PowerState -eq "VM deallocated"){
        Write-Output "Starting $($mne2stat.Name)"
        Start-AzVM -Name $mne2 -ResourceGroupName $rg
    }
    else {Write-Output "$($mne2stat.Name) already running"}
}

pause