
#************************************* Variables *************************************

$location = "CanadaCentral"
$Groupederessources = "GR4-Groupe-de-ressources"
$domain="gr4.local"


#=============================== Les differents path des scripts 

$PathDNS = "C:\Users\Freskim\Desktop\Project Powershell\fait\ESGI-GR4-DNS.ps1"
$PathChrome = "C:\Users\Freskim\Desktop\Project Powershell\fait\ESGI-GR4-Google-Chrome.ps1"
$PathDomain = "C:\Users\Freskim\Desktop\Project Powershell\fait\ESGI-GR4-Domain.ps1"
$Path7zip = "C:\Users\Freskim\Desktop\Project Powershell\fait\ESGI-GR4-7zip.ps1"
$PathFirefox = "C:\Users\Freskim\Desktop\Project Powershell\fait\ESGI-GR4-Firefox.ps1"


#************************************* Les Fonctions *************************************



#=============================== Windows Form ===============================

function ESGI-GR4-checkbox{
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
    
    # Set the size of your form
    $Form = New-Object System.Windows.Forms.Form
    $Form.width = 500
    $Form.height = 200
    $Form.Text = ”Les applications a installer ?”
 
    # Set the font of the text to be used within the form
    $Font = New-Object System.Drawing.Font("Freskim",12)
    $Form.Font = $Font

 
    # create checkbox AjouterDomain
    $AjouterDomain = new-object System.Windows.Forms.checkbox
    $AjouterDomain.Location = new-object System.Drawing.Size(200,30)
    $AjouterDomain.Size = new-object System.Drawing.Size(200,30)
    $AjouterDomain.Text = "Ajouter au Domaine"
    $AjouterDomain.Checked = $false
    $Form.Controls.Add($AjouterDomain)  
 

    # create checkbox Notepad++
    $7zip = new-object System.Windows.Forms.checkbox
    $7zip.Location = new-object System.Drawing.Size(200,60)
    $7zip.Size = new-object System.Drawing.Size(200,30)
    $7zip.Text = "7zip"
    $7zip.Checked = $false
    $Form.Controls.Add($7zip)  




     # create checkbox FireFox
    $FireFox = new-object System.Windows.Forms.checkbox
    $FireFox.Location = new-object System.Drawing.Size(30,60)
    $FireFox.Size = new-object System.Drawing.Size(190,30)
    $FireFox.Text = "FireFox"
    $FireFox.Checked = $false
    $Form.Controls.Add($FireFox)  



        # create checkbox GoogleChrome
    $GoogleChrome = new-object System.Windows.Forms.checkbox
    $GoogleChrome.Location = new-object System.Drawing.Size(30,30)
    $GoogleChrome.Size = new-object System.Drawing.Size(190,30)
    $GoogleChrome.Text = "GoogleChrome"
    $GoogleChrome.Checked = $false
    $Form.Controls.Add($GoogleChrome) 








    # Add an OK button
    $OKButton = new-object System.Windows.Forms.Button
    $OKButton.Location = new-object System.Drawing.Size(130,100)
    $OKButton.Size = new-object System.Drawing.Size(100,40)
    $OKButton.Text = "OK"
    $OKButton.Add_Click({$Form.Close()})
    $form.Controls.Add($OKButton)


 
    #Add a cancel button
    $CancelButton = new-object System.Windows.Forms.Button
    $CancelButton.Location = new-object System.Drawing.Size(255,100)
    $CancelButton.Size = new-object System.Drawing.Size(100,40)
    $CancelButton.Text = "Cancel"
    $CancelButton.Add_Click({$Form.Close()})
    $form.Controls.Add($CancelButton)
    

 
  


    # Activate the form
    $Form.Add_Shown({$Form.Activate()})
    [void] $Form.ShowDialog() 
  
   if ($GoogleChrome.checked -eq "True"){
    $GoogleChrome="OUI"

#=============================== Permet d'installer google chrome ===============================

        if ( $GoogleChrome -eq "OUI") {
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
    else{
    $GoogleChrome="Non"
    }
    

       if ($7zip.checked -eq "True"){
    $7zip="OUI"
    #=============================== Permet d'installer 7Zip ===============================

        if ( $7zip -eq "OUI") {
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
             -ScriptPath $Path7zip
             }
        }

    }
    else{
    $Notepad="Non"
    }


    if ($FireFox.checked -eq "True"){
    $FireFox="OUI"
        #=============================== Permet d'installer Notepad++ ===============================

        if ( $FireFox -eq "OUI") {
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
             -ScriptPath $PathFirefox
             }
        }



    }
    else{
    $FireFox="Non"
}



    if ($AjouterDomain.checked -eq "True"){
    $AjouterDomain="OUI"
            #=============================== configurer le DNS sur les machines ===============================

        if ( $AjouterDomain -eq "OUI") {
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


        #=============================== Ajouter la VM dans le Domaine ===============================

        if ($AjouterDomain -eq "OUI"){
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



        if ($AjouterDomain -eq "OUI"){
        if($?){
            Restart-AzVM -Name $nomVm -ResourceGroupName $Groupederessources
            echo " la machine $nomVm vient d'être redemarré"
        }
        else{
            echo "l'integration de la machine dans l'AD n'a pas fonctionnée"
        }
        }





    }
    else{
    $AjouterDomain="Non"
}




}


#===============================La fonction qui permet de créée la machine virtuelle 


function ESGI-GR4-CreateVM {
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


#=============================== Creation du login plus mdp local pour les machines ===============================


$VMLocalUserName = "usergr4"
$VMLocalAdminSecurePassword = ConvertTo-SecureString "P@ssword" -AsPlainText -Force
$UserPassword = New-Object System.Management.Automation.PSCredential($VMLocalUserName, $VMLocalAdminSecurePassword)



#=============================== Demander le nom de la machine virtuelle ===============================

$nomVm = Read-Host "Donner le nom de la machine virtuelle"


#=============================== Verifier si la machine existe ===============================


$vm = Get-AzVM -ResourceGroupName $Groupederessources
$vm.Name|foreach{
    if ($nomVm -eq $_){
        echo "la machine virtuelle avec le nom $_ existe "
    }
    else {
         ESGI-GR4-CreateVM

         }
    }




#===================== appeler la function =====================

ESGI-GR4-checkbox