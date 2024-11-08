$input = ""
while ($input -ne "done") {
    get-date -UFormat %Y%m%d%I%M 
    $input = Read-Host "Hit 'Enter' (type 'done' when finish) "
}
pause