
#=============================== Variables 

$location = "CanadaCentral"
$Groupederessources = "GR4-Groupe-de-ressources"
$domain="gr4.local"
$PathScripAD = "C:\Users\Freskim\Desktop\Project Powershell\fait\ESGI-GR4-Script-creation-foret.ps1"


#=============================== Creation du login avec le mdp local pour la machine virtuelle


$VMLocalUserName = "admgr4"
$VMLocalAdminSecurePassword = ConvertTo-SecureString "P@ssword" -AsPlainText -Force
$UserPassword = New-Object System.Management.Automation.PSCredential($VMLocalUserName, $VMLocalAdminSecurePassword)



#=============================== Les Fonctions 


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


#=============================== Demander à l'utilisateur le nom de la MV

$nomVm = Read-Host "Donner le nom de la machine virtuelle"


#=============================== Vérifier si la machine existe déjà


$vm = Get-AzVM -ResourceGroupName $Groupederessources
$vm.Name|foreach{
    if ($nomVm -eq $_){
        echo "la machine virtuelle avec le nom $_ existe "
    }
    else {
         CreateVM

         }
    }

#=============================== Vérifier qu'on peut installer le service AD


Do {
    $StatusVM = (Get-AzVM -ResourceGroupName $Groupederessources -Name $nomVm -Status).VMAgent.Statuses.DisplayStatus
    echo "En attente pour ajouter le service AD"
    sleep 10
} until ($StatusVM -eq "Ready")





if ($StatusVM -eq "Ready"){
Invoke-AzVmRunCommand `
     -ResourceGroupName $Groupederessources `
     -VMName "$nomVm" `
     -CommandId "RunPowerShellScript" `
     -ScriptPath $PathScripAD
}