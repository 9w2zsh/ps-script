Uninstall-Package -Name "Quest Migrator for Notes to Exchange"
Write-Host "`nMNE deleted..." -ForegroundColor Yellow
Start-Sleep -Milliseconds 3000

Remove-Item "C:\MNE\CommonTools\*.*"
Write-Host "`nFiles in CommonTools deleted..." -ForegroundColor Yellow

$currentDir = $pwd
$hostname = hostname
$SqlServer = $hostname + "\SQLExpress"

$DbName = Invoke-Sqlcmd -ServerInstance $SqlServer -Query "SELECT name FROM master.dbo.sysdatabases WHERE name = 'NME40DB'"
if ($null -ne $DbName) {
    Invoke-Sqlcmd -ServerInstance $SqlServer -Query "Alter database [NME40DB] set single_user with rollback immediate; USE [master]; DROP DATABASE [NME40DB]" 
    Write-Host "`nMNE database deleted..." -ForegroundColor Yellow
}

pause