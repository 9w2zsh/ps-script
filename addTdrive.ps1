cmd.exe /C "cmdkey /add:`"alabbtdts7030.file.core.windows.net`" /user:`"localhost\alabbtdts7030`" /pass:`"EkzXH6czIXzSYiTwwuTASR2T0TtfAu70mHay2Itczlut1e6RCjQNZ/jp5/zK1zGT7SABhWLIw+Z6Mji9cTYSNg==`""

# Mount the drive
if (get-childitem -path t:\ -ErrorAction SilentlyContinue)
{ Write-Host "T drive already mapped" -ForegroundColor Green }
Else {
     New-PSDrive -Name T -PSProvider FileSystem -Root "\\alabbtdts7030.file.core.windows.net\datacore" -Persist
}