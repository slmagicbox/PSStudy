Set-Item WSMan:\localhost\client\trustedhosts * -Force 
Set-Item WSMan:\localhost\client\trustedhosts *.ew.lab -Force

Get-Item WSMan:\localhost\client\*

$cred = Get-Credential -Credential administrator
Enter-PSSession -ComputerName ex13-dc01.ew.lab -Credential $cred

Exit-PSSession