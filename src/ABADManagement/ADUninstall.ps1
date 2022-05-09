function ABDowngrade{
    #Downgrade the server from a domain controller
    Uninstall-ADDSDomainController -DemoteOperationMasterRole:$true -IgnoreLastDnsServerForZone:$true -LastDomainControllerInDomain:$true -RemoveDnsDelegation:$true -RemoveApplicationPartitions:$true -IgnoreLastDCInDomainMismatch:$true -Force:$true
}
function ABRmFeatures{
     #remove AD and DNS
     Uninstall-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
     Uninstall-WindowsFeature -Name DNS -IncludeManagementTools
}