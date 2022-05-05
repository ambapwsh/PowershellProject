#Test
#=============================== Variables 

$location = "CanadaCentral"
$Groupederessources = "GR4-Groupe-de-ressources"
$domain="gr4.local"
$PathScripAD = "C:\Users\Freskim\Desktop\Project Powershell\Script-creatio- foret.ps1"


#=============================== Creation du login plus mdp local pour les machines 


$VMLocalUserName = "Freskim"
$VMLocalAdminSecurePassword = ConvertTo-SecureString "P@ssword" -AsPlainText -Force
$UserPassword = New-Object System.Management.Automation.PSCredential($VMLocalUserName, $VMLocalAdminSecurePassword)



#=============================== Les Fonction 

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

$nomVm = Read-Host "Donner le nom de la machine virtuelle"


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


Do {
    $StatusVM = (Get-AzVM -ResourceGroupName $Groupederessources -Name $nomVm -Status).VMAgent.Statuses.DisplayStatus
    echo "Att pour ajouter le service AD"
    sleep 5
} until ($StatusVM -eq "Ready")


echo "REDY !!!!!"



if ($StatusVM -eq "Ready"){
Invoke-AzVmRunCommand `
     -ResourceGroupName $Groupederessources `
     -VMName "$nomVm" `
     -CommandId "RunPowerShellScript" `
     -ScriptPath $PathScripAD
}