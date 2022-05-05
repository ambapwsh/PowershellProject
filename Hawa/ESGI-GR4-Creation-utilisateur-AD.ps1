
$infoutilisateur = ""
$SavePath = "C:\Users\USER\Documents\User.csv"


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
    if ($uni) {Write-Host("L'unite $ecole existe dÃ©jÃ ")}
else{
	                       #Creation des UNITES 
New-ADOrganizationalUnit "$ecole"
Write-Host("L'unite $ecole s'est crÃ©Ã© avec succÃ¨s.")
}

#=======================CrÃ©ation des UNITES====================================
$uni=Get-ADOrganizationalUnit -Filter { name -eq $gr}
    if ($uni) {Write-Host("L'unitÃ© $gr existe dÃ©jÃ ")}
else{
	                       #Creation des UNITES 
New-ADOrganizationalUnit -Name "$gr" -Path $pathOU -ProtectedFromAccidentalDeletion $false
 Write-Host("L'unitÃ© $gr s'est crÃ©Ã©e avec succÃ¨s.")
}



#==============================CrÃ©ation des Groupes============================


$grp= get-adgroup -Filter { samaccountname -eq $gr}
    #if else done
    if ($grp) {Write-Host("Le Groupe $gr existe dÃ©jÃ ")}
    else{
    ## Creation du Groupe
    New-ADGroup -Name "$gr" -SamAccountName $gr -GroupCategory Security -GroupScope Global -Path $groupPATH
      #Message
    Write-Host("Le goupe : $gr s'est crÃ©Ã© avec succÃ¨s.")
    }


#==============================CrÃ©ation des utilisateurs============================



 $usr=Get-ADUser -Filter { SamAccountName -eq $acc}
    if ($usr) {Write-Host("l'utilisateur $acc existe dÃ©jÃ ")}

    else{
            ##Creation des utilisateurs 
	New-ADuser -UserPrincipalName $acc@gr4.local -SamAccountName $acc -Name $pre -GivenName $pre -SurName $nom -Path $groupPATH 
 
   $date= Get-Date
            ##mesagge de fin
    $infoutilisateur += "-------------------------------------$date---------------------------------`nL'utilisateur: $pre $nom`nNom d'utilisateur: $acc`nIl fait partie du groupe : $gr `nle mdp: $mdp2`n"
}

#Save to .csv file
$service | Export-CSV -Path $SavePath

#==============================CrÃ©ation des MDP par dÃ©faut============================

$usr=Get-ADUser -Filter { SamAccountName -eq $acc}
    if ($usr) {
             #CrÃ©ation des MDP par defaut
                     Set-ADAccountPassword -Identity $acc -NewPassword $mdp â€“Reset 
                     Set-ADUser $acc -ChangePasswordAtLogon $true
else {Write-Host("l'utilisateur $acc n'existe pas")
}

#==============================Activer les utilisateurs============================

$usr=Get-ADUser -Filter { SamAccountName -eq $acc}
    if ($usr) {
       #Activer les utilisateurs
   Set-ADUser -Identity $acc -Enabled $true
   }
   else {Write-Host("l'utilisateur $acc il n'existe pas")}

}

}
