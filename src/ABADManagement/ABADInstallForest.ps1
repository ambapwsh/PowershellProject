function InstallADForest{
    #gobal var for configuration 
    $DatabasePath = "C:\windows\NTDS"
    $DomainMode = "WinThreshold"
    $DomainName = "esgihamfa.fr"
    $DomainNameNetbios = "ESGIHAMFA"
    $ForestMode = "WinThreshold"
    $SysVolPath = "C:\windows\SYSVOL"
    $Password = "Admin2021"
    $SecureString = ConvertTo-SecureString $Password -AsPlainText -Force

    Install-ADDSForest -DomainName $DomainName -DatabasePath $DatabasePath -DomainMode $DomainMode  -SafeModeAdministratorPassword $SecureString -DomainNetbiosName $DomainNameNetbios -ForestMode $ForestMode -InstallDns:$true -NoRebootOnCompletion:$false -SysvolPath $SysVolPath -Force:$true  
}
InstallADForest