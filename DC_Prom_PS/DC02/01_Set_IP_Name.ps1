﻿#set-ExecutionPolicy remotesigned -force#set static IP address$ipaddress = "172.16.200.177"$ipprefix = "24"$ipgw = "172.16.200.1"$ipdns = ("172.16.200.178","172.16.200.177")$ipif = (Get-NetAdapter).ifIndexNew-NetIPAddress -IPAddress $ipaddress -PrefixLength $ipprefix -InterfaceIndex $ipif -DefaultGateway $ipgwSet-DnsClientServerAddress -InterfaceIndex $ipif -ServerAddresses $ipdns#rename the computer$newname = "pslab-dc02"Rename-Computer -NewName $newname -force#restart the computerRestart-Computer