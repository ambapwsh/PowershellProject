#************************************* Variables *************************************

$location = "CanadaCentral"
$Groupederessources = "GR4-Groupe-de-ressources"
$Chrome = "NON" #Oui pour l'installation Google Chrome
$DNS = "NON" # OUI pour ajouter le DNS 
$AjDomain = "NON" # OUI pour ajouter la machine dans le domaine
$domain="gr4.local"
$PathDNS = "C:\Users\Freskim\Desktop\Project Powershell\DNS.ps1"
$PathChrome = "C:\Users\Freskim\Desktop\Project Powershell\Google-Chrome.ps1"
$PathDomain = "C:\Users\Freskim\Desktop\Project Powershell\Domain.ps1"

#************************************* Les Fonctions *************************************


#=============================== Creation du login plus mdp local pour les machines ===============================

function CreationMDP {
$VMLocalUserName = "Freskim"
$VMLocalAdminSecurePassword = ConvertTo-SecureString "P@ssword" -AsPlainText -Force
$UserPassword = New-Object System.Management.Automation.PSCredential($VMLocalUserName, $VMLocalAdminSecurePassword)
}

#La fonction qui permet de demander le nom de la machine virtuelle
function DemanderNomVM {
$nomVm = Read-Host "Donner le nom de la machine virtuelle"
return $nomVm
}
#La fonction qui permet de créée la machine virtuelle 

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

#La fonction qui permet de Tester si la machine existe  

function TestsiVmExiste {
$vm = Get-AzVM -ResourceGroupName $Groupederessources
$vm.Name|foreach{
    if ($nomVm -eq $_){
        echo "la machine virtuelle avec le nom $_ existe "
    }
    else {
         CreateVM

         }
    }
}


#La fonction qui permet d'installer google chrome 

function InstallChrome {
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
     -ScriptPath $PathChrome
     }
}
}


#La fonction qui permet de configurer le DNS sur les machines

function AjouterDNS{
if ( $DNS -eq "OUI") {
Do {
    $StatusVM = (Get-AzVM -ResourceGroupName $Groupederessources -Name $nomVm -Status).VMAgent.Statuses.DisplayStatus
    echo "En attente de la finalisation de la Machine Virtuelle pour configurer le DNS"
    sleep 5
} until ($StatusVM -eq "Ready")


if ($StatusVM -eq "Ready"){
Invoke-AzVmRunCommand `
     -ResourceGroupName $Groupederessources `
     -VMName "$nomVm" `
     -CommandId "RunPowerShellScript" `
     -ScriptPath $PathDNS
}

}
}

#La fonction qui permet d'Ajouter la VM dans le Domaine

function AjouterlaVmdansleDomain {
if ($AjDomain -eq "OUI"){
Do {
    $StatusVM = (Get-AzVM -ResourceGroupName $Groupederessources -Name $nomVm -Status).VMAgent.Statuses.DisplayStatus
    echo "En attente de la finalisation de la Machine Virtuelle pour ajouter la machine sur le Domaine"
    sleep 5
} until ($StatusVM -eq "Ready")

if ($StatusVM -eq "Ready"){

Invoke-AzVmRunCommand `
     -ResourceGroupName $Groupederessources `
     -VMName "$nomVm" `
     -CommandId "RunPowerShellScript" `
     -ScriptPath $PathDomain
     }
}


if ($AjDomain -eq "OUI"){
if($?){
    Restart-AzVM -Name $nomVm -ResourceGroupName $Groupederessources
    echo " la machine $nomVm vien d'être redemarré"
}
else{
    echo "l'integration de la machine dans l'AD n'a pas fonctionnée"
}
}

}

#=============================== création du mdp
CreationMDP
#=============================== Demander à l'utilisateur le nom de la VM
DemanderNomVM
#=============================== Tester si la machine existe 
TestsiVmExiste
#===============================  Installation de Google Chrome
InstallChrome
#================ Ajoute de l'adresse ip de l'AD en tant que DNS
AjouterDNS
#================ Ajout de la Machine Virtuelle dans le domaine
AjouterlaVmdansleDomain
