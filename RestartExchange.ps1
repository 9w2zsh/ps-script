#get List of Microsoft Exchange Services
$services = Get-Service | ? { $_.name -like "MSExchange*" -and $_.Status -eq "Running"}
#restart each service
foreach ($service in $services)
{
Restart-Service $service.name -Force
}