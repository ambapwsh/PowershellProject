function RenameServerName{
#begin by renaming Server Name and rebooting 
Rename-Computer -NewName DOUAMDC01
Restart-Computer -Force
}

function  deploy {
$computerName = $env:COMPUTERNAME
$state = Get-Service -Name LanmanServer -ComputerName $computerName
$FeatureList = @("AD-Domain-Services","DNS")

    if ($state.Status -eq "running") {
        New-NetIPAddress -IPAddress "172.16.20.22" -DefaultGateway "172.16.20.1" -PrefixLength "24" -InterfaceIndex (Get-NetAdapter).IfIndex[1]
        Set-DnsClientServerAddress -InterfaceIndex (Get-NetAdapter).IfIndex[1] -ServerAddresses ("127.0.0.1")
        
        
        }
        #Install-WindowsFeature -name AD-Domain-Services -IncludeAllSubFeature -IncludeManagementTools
    
    else{
    write-Output "le Déploiement de l'AD et des services assosciés a échoué !"   
        }
        #Install-WindowsFeature -name AD-Domain-Services -IncludeAllSubFeature -IncludeManagementTools 
            
            
            #Install-WindowsFeature -name $Feature -IncludeAllSubFeature -IncludeManagementTools
                foreach($Feature in $FeatureList){
                if(((Get-WindowsFeature -Name $Feature).InstallState) -eq "Available"){

                Write-Output"Feature $Feature will be installed now !"

                Try{

                Add-WindowsFeature -Name $Feature -IncludeManagementTools -IncludeAllSubFeature 

                Write-Output "$Feature : Installation is a success !"


                }Catch{

                Write-Output "$Feature : Error during installation !"
                }
            } 
        }
}

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


