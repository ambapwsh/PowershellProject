$foldeBrowser = New-Object System.Windows.Forms.OpenFileDialog
$foldeBrowser.ShowDialog()
$file = $foldeBrowser.FileName
Foreach ($ligne in Get-Content $file)
{

$util = $ligne.Split(":")
	$pre=$util[0]
	$nom=$util[1]
    $gr=$util[2]
    $acc= $pre
    $acc= $acc.ToLower()
	$pathOU = "OU=$ecole,DC=gr4,DC=local"
    $groupPATH = "OU=$gr,$pathOU"
    $domain = "gr4.local"
    $mdp2 = "P@ssw0rd"
    $mdp = ConvertTo-SecureString $mdp2 -AsPlainText -Force
    $ecole = "ESGI"


$uni=Get-ADOrganizationalUnit -Filter { name -eq $ecole}
    if ($uni) {Write-Host("L'unite $ecole il existe deja")}
else{
	                       #Creation des UNITES 
New-ADOrganizationalUnit "$ecole"

                           #Message
 Write-Host("L'unite $ecole Il s'est créé avec succès.")
}





#=======================Création des UNITE====================================

$uni=Get-ADOrganizationalUnit -Filter { name -eq $gr}
    if ($uni) {Write-Host("L'unite $gr il existe deja")}
else{
	                       #Creation des UNITES 
New-ADOrganizationalUnit -Name "$gr" -Path $pathOU -ProtectedFromAccidentalDeletion $false

                           #Message
 Write-Host("L'unite $gr Il s'est créé avec succès.")
}



#==============================Création des Groupes============================


$grp= get-adgroup -Filter { samaccountname -eq $gr}
    #if else done
    if ($grp) {Write-Host("Le Groupe $gr il existe deja")}
    else{
    ## Creation du Groupe
    New-ADGroup -Name "$gr" -SamAccountName $gr -GroupCategory Security -GroupScope Global -Path $groupPATH
      #Message
    Write-Host("Le groupe : $gr Il s'est créé avec succès.")
    }

$infoutilisateu = ""

#==============================Création des utilisateurs============================


 $usr=Get-ADUser -Filter { SamAccountName -eq $acc}
    if ($usr) {Write-Host("l'utilisateur $acc il existe deja")}

    else{
            ##Creation des utilisateurs 
	New-ADuser -UserPrincipalName $acc@gr4.local -SamAccountName $acc -Name $pre -GivenName $pre -SurName $nom -Path $groupPATH 
 
   $date= Get-Date
            ##mesagge de fin
    $infoutilisateur += "-------------------------------------$date---------------------------------`nL'utilisateur: $pre $nom`nNom d'utilisateur: $acc`nIl fait partie du groupe : $gr `nle mdp: $mdp2`n"
}


#$text = $infoutilisateu | Out-File $text -FilePath C:\data\Inofuser.txt


#==============================Création des MDP par defaut============================

$usr=Get-ADUser -Filter { SamAccountName -eq $acc}
    if ($usr) {
             #Création des MDP par defaut
                     Set-ADAccountPassword -Identity $acc -NewPassword $mdp –Reset 
                     Set-ADUser $acc -ChangePasswordAtLogon $false
	                 Write-Host("L'utilisateur $acc à pour mdp : $mdp2")}
else {Write-Host("l'utilisateur $acc il n'existe pas")
}



#==============================Activer les utilisateurs============================

$usr=Get-ADUser -Filter { SamAccountName -eq $acc}
    if ($usr) {
       #Activer les utilisateurs
   Set-ADUser -Identity $acc -Enabled $true
   Set-ItemProperty ‘HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\‘ -Name “UserAuthentication” -Value 1
   Write-Host("L'utilisateur $acc il est Activer")
   }
   else {Write-Host("l'utilisateur $acc il n'existe pas")}






}