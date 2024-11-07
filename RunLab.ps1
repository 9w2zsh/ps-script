# define variables
$labName = @("QA365", "QA2016", "QA365D12", "QA2019", "ZSMNE", "ZSJUMBOX")
$qa365lab = @("QA365MNE1", "QA365MNE2", "QA365MNE3", "QA365DOM10M", "QA365DOM11C", "QA365BTUSR1", "QA365BTUSR2", "QA365BTUSR3", "QA365BTUSR4", "QA365SQL1", "QA365SQL2", "QA365BTMNCON2", "QA365BTMNCON3", "QA365BTMNWKR3", "QA365BTMNWKR5", "QA365BTMNWKR7", "QA365BTMNWKR8", "QA365BTMNWKR9", "QA365IIS")
$qa365d12lab = @("QA365D12BTUSR1", "QA365D12BTUSR2", "QA365D12CON1", "QA365D12DOM12C", "QA365D12DOM12M", "QA365D12IIS1", "QA365D12MNE1", "QA365D12MNE2", "QA365D12MNE3", "QA365D12SQL1", "QA365D12SSDM1", "QA365D12SSDM2", "QA365D12WKR1", "QA365D12WKR2")
$qa2016lab = @("QA2016DC1")
$qa2019lab = @("QA2019CA1", "QA2019DC1", "QA2019BTMNCON", "QA2019BTMNWKR1", "QA2019DOM9C", "QA2019DOM9M", "QA2019EXCH1", "QA2019EXCH2", "QA2019IIS", "QA2019IIS2", "QA2019SQL1")
$zsmnelab = @("ZSMNElab")
$labInput = @()

Write-Host "`n>>> Enter the LAB name to RUN and press [Enter] ..." -ForegroundColor Green
if (!($lab = Read-Host "1: [QA365], `n2: [QA365D12], `n3: [QA2016], `n4: [QA2019], `n5: [ZSMNE], `n6: [JUMBOX] `n7: [DEV5] `nEnter number:")) { $lab = "1" }

if ($lab -eq "1") {
    $rg = "QA365-RG"
    $dc = "QA365DC1"
    $dom = "QA365DOM11M"

    for ($i = 0; $i -lt $qa365lab.Length; $i++) {
        Write-Host "[$i]: $($qa365lab[$i])"
    }

    do {
        $input = Read-Host "Enter VM to run and hit 'Enter' (type 'done' when finish)"
        if ($input -ne "done") {
            $labInput += $input
        }
    } until ($input -eq "done")

    $dcstat = Get-AzVm -Name $dc -Status | Select-Object Name, PowerState
    if ($dcstat.PowerState -eq "VM deallocated") {
        Write-Output "`nStarting $($dcstat.Name)"
        Start-AzVM -Name $dc -ResourceGroupName $rg
    }
    else { Write-Output "`n$($dcstat.Name) already running" }

    $domstat = Get-AzVm -Name $dom -Status | Select-Object Name, PowerState
    if ($domstat.PowerState -eq "VM deallocated") {
        Write-Output "Starting $($domstat.Name)"
        Start-AzVM -Name $dom -ResourceGroupName $rg
    }
    else { Write-Output "$($domstat.Name) already running" }

    for ($j = 0; $j -lt $labInput.Length; $j++) {
        $currVM = $labInput[$j]
        $vmName = $($qa365lab[$currVM])
        $vmStat = Get-AzVm -Name $vmName -Status | Select-Object Name, PowerState
        if ($vmStat.PowerState -eq "VM deallocated") {
            Write-Output "`n$($vmStat.Name) not started. Starting now"
            Start-AzVM -Name $vmName -ResourceGroupName $rg
        }
        else { Write-Output "$($vmStat.Name) already running" }
    }
    pause
}
elseif ($lab -eq "2") {
    $dc = "QA365D12DC1"
    $rg = "QA365D12-RG"
    
    for ($i = 0; $i -lt $qa365d12lab.Length; $i++) {
        Write-Host "VM name $($qa365d12lab[$i])"
    }
}
elseif ($lab -eq "3") {
    $dc = "QA2016DC1"
    $rg = "QA2016-RG"
    for ($i = 0; $i -lt $qa2016lab.Length; $i++) {
        Write-Host "VM name $($qa2016lab[$i])"
    }
}
elseif ($lab -eq "4") {
    $dc = "QA2019CA1"
    $rg = "QA2019-RG"

    for ($i = 0; $i -lt $qa2019lab.Length; $i++) {
        Write-Host "VM name $($qa2019lab[$i])"
    }
}
elseif ($lab -eq "5") {
    $rg = "ZSMNE"

    for ($i = 0; $i -lt $zsmnelab.Length; $i++) {
        Write-Host "VM name $($zsmnelab[$i])"
    }
}
elseif ($lab -eq "6") {
    for ($i = 0; $i -lt $zsjumbox.Length; $i++) {
        Write-Host "VM name $($zsjumbox[$i])"
    }
}
elseif ($lab -eq "7") {
    for ($i = 0; $i -lt $dev5.Length; $i++) {
        Write-Host "VM name $($dev5[$i])"
    }
}
else { Write-Output "`nLab not found, pls check lab name"; pause; return }