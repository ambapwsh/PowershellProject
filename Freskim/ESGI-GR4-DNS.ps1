<<<<<<< HEAD
﻿#================ Ajouter l'adress ip de l'ad en DNS
=======
#================ Ajoute de l'adresse IP de l'AD en tant que DNS
>>>>>>> 2970e8471c5b9ba7d88e13bdc727d3ddce939477

$dns1 = "192.168.1.4"
$dns2 = "168.63.129.16"

$interface = Get-NetAdapter | Select-Object  InterfaceIndex
set-DnsClientServerAddress -InterfaceIndex $interface.InterfaceIndex -ServerAddresses ("$dns1","$dns2")
