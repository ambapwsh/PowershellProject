#=============================== Variables 

$location = "CanadaCentral"
$Groupederessources = "GR4-Groupe-de-ressources"
$Chrome = "NON" #Oui pour installe Google Chrome
$DNS = "OUI" # OUI pour ajouter le DNS 
$AjDomain = "OUI" # OUI pour ajouter la machine dnas le domain
$domain="gr4.local"



#=============================== Creation du login plus mdp local pour les machines ===============================


$VMLocalUserName = "Freskim"
$VMLocalAdminSecurePassword = ConvertTo-SecureString "P@ssword" -AsPlainText -Force
$UserPassword = New-Object System.Management.Automation.PSCredential($VMLocalUserName, $VMLocalAdminSecurePassword)



#=============================== Les Fonction ===============================


function CreateVM {
New-AzVm `
        -ResourceGroupName $Groupederessources `
        -Name $nomVm `
        -Location $location `
        -VirtualNetworkName 'GR4-reseau-virtuel' `
        -SubnetName 'GR4-sous-reseau' `
        -SecurityGroupName 'GR4-groupe-de-securite-reseau' `
        -PublicIpAddressName "GR4-ip-publique-$nomVm" `
        -Size "Standard_DS1_v2" `
        -Credential $UserPassword `
        -OpenPorts 80,3389

}

#=============================== Demander a l'utilisateur le nom de la VM

$nomVm = Read-Host "Donner l'nom de la machine virtuelle"


#=============================== Tester si la machine existe 


$vm = Get-AzVM -ResourceGroupName $Groupederessources
$vm.Name|foreach{
    if ($nomVm -eq $_){
        echo "la machine virtuelle avec le nom $_ existe "
    }
    else {
         CreateVM

         }
    }

#=============================== 

if ( $Chrome -eq "OUI") {
Do {
    $StatusVM = (Get-AzVM -ResourceGroupName $Groupederessources -Name $nomVm -Status).VMAgent.Statuses.DisplayStatus
    
    echo "le Status de la vm : $nomVm est $StatusVM "
    Start-Sleep -s 5
} until ($StatusVM -eq "Ready")

if ($StatusVM -eq "Ready"){
Invoke-AzVmRunCommand `
     -ResourceGroupName $Groupederessources `
     -VMName "$nomVm" `
     -CommandId "RunPowerShellScript" `
     -ScriptPath "C:\Users\Freskim\Desktop\Project Powershell\Google-Chrome.ps1"
     }
}

#================ Ajouter l'adress ip de l'ad en DNS
if ( $DNS -eq "OUI") {
Do {
    $StatusVM = (Get-AzVM -ResourceGroupName $Groupederessources -Name $nomVm -Status).VMAgent.Statuses.DisplayStatus
    echo "Att pour ajouter le DNS"
    sleep 5
} until ($StatusVM -eq "Ready")


if ($StatusVM -eq "Ready"){
Invoke-AzVmRunCommand `
     -ResourceGroupName $Groupederessources `
     -VMName "$nomVm" `
     -CommandId "RunPowerShellScript" `
     -ScriptPath "C:\Users\Freskim\Desktop\Project Powershell\DNS.ps1"
}

}


#================ Ajouter DOMAIN

if ($AjDomain -eq "OUI"){
Do {
    $StatusVM = (Get-AzVM -ResourceGroupName $Groupederessources -Name $nomVm -Status).VMAgent.Statuses.DisplayStatus
    echo "att pour ajouter la machine sur le Domain"
    sleep 5
} until ($StatusVM -eq "Ready")

if ($StatusVM -eq "Ready"){

Invoke-AzVmRunCommand `
     -ResourceGroupName $Groupederessources `
     -VMName "$nomVm" `
     -CommandId "RunPowerShellScript" `
     -ScriptPath "C:\Users\Freskim\Desktop\Project Powershell\Domain.ps1"
     }
}



if ($AjDomain -eq "OUI"){
if($?){
    Restart-AzVM -Name $nomVm -ResourceGroupName $Groupederessources
    echo " la machine $nomVm vien de redemarre"
}
else{
    echo "l'integration de la machine dnas l'ad n'a pas fonctionne"
}
}
