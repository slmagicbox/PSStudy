$cred = Get-Credential
Enter-PSSession -ComputerName w8c-dc01 -Credential $cred

Import-Module ActiveDirectory
Get-Command -Module ActiveDirectory | Format-Wide -Property Name -Column 4
New-ADOrganizationalUnit -Name MyOU -Path "DC=lab,DC=ew"
New-ADUser -Name Test03 -Path "OU=MyOU,DC=lab,DC=ew"

Get-ADUser -Filter * -searchbase "ou=MyOU,dc=lab,dc=ew" -Properties MemberOf | select Name,MemberOf | Format-Table -Wrap -AutoSize
Get-ADUser -Filter * -searchbase "ou=MyOU,dc=lab,dc=ew" -Properties MemberOf | Export-Csv -Path "c:\temp\123.csv"

Exit-PSSession