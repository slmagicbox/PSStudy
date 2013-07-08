<<<<<<< HEAD
﻿Set-Item WSMan:\localhost\client\trustedhosts "*.ew.lab" -Force 
Get-Item WSMan:\localhost\client\*

$cred = Get-Credential
Enter-PSSession -ComputerName ex13-dc01 -Credential $cred 
=======
﻿Set-Item WSMan:\localhost\client\trustedhosts * -Force 
Set-Item WSMan:\localhost\client\trustedhosts *.ew.lab -Force

Get-Item WSMan:\localhost\client\*

$cred = Get-Credential
Enter-PSSession -ComputerName ex13-dc01.ew.lab -Credential $cred
>>>>>>> 084ca5877ed984ab88ef3c858eaf210fdc6053ee
