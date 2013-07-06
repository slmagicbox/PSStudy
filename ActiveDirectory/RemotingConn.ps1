Set-Item WSMan:\localhost\client\trustedhosts "*.ew.lab" -Force 
Get-Item WSMan:\localhost\client\*

$cred = Get-Credential
Enter-PSSession -ComputerName ex13-dc01 -Credential $cred 