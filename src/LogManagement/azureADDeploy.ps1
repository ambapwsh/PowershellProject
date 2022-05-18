function RenameServerName{
    #begin by renaming Server Name and rebooting 
    Rename-Computer -NewName ESGIDC01
    Restart-Computer -Force
}

function  deploy {
    $ip = "10.1.0.22"
    $defaultGateway = "10.1.0.1"
    New-NetIPAddress -IPAddress $ip -DefaultGateway $defaultGateway -PrefixLength 24 -InterfaceIndex (Get-NetAdapter).InterfaceIndex
    Set-DnsClientServerAddress -InterfaceIndex (Get-NetAdapter).InterfaceIndex -ServerAddresses $ip 
    Install-WindowsFeature -name AD-Domain-Services $Feature-IncludeManagementTools
    Install-ADDSForest -DomainName ESGI-hamfa.fr -DomainNetbiosName AD -InstallDns
}

