Install-WindowsFeature AD-Domain-Services -IncludeManagementTools



$SafeModeAdministratorPassword = ConvertTo-SecureString "P@ssword" -AsPlainText -Force
Install-ADDSForest -DomainName "gr4.local" -DomainNetBiosName "gr4" -InstallDns:$true -SafeModeAdministratorPassword $SafeModeAdministratorPassword -Force