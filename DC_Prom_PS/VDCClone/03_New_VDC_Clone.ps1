New-ADDCCloneConfigFile `
-Static `
-IPv4Address "172.16.200.175" `
-IPv4SubnetMask "255.255.255.0" `
-IPv4DefaultGateway "172.16.200.1" `
-IPv4DNSResolver ("172.16.200.178","172.16.200.177") `
-CloneComputerName "PSLAB-DC03"`
-SiteName "Default-First-Site-Name"