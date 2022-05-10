#Import the active directory module
Import-Module ActiveDirectory
#Global variables 
$users = "esgi-hafa.fr/users"

#List all AD users with limit of 100 users - this is important for larger domains

function ABGetADUsers{
    Get-ADUser -Filter * -SearchBase $users 
}
 

function GetABADUser{
    #Get the path to our target CSV file
    $filepath =Read-Host -Prompt "Veuillez indiquer le chemin du fichier csv contenant les utilisateurs"    
    #Importing the csv as an array 
    $users = Import-Csv $filepath

    #get each user in csv file
    foreach($user in $users){
        $accountNumber = verifyUsername($user.'prenom'[0] +  $user.'Nom')
        $username = ($user.'Prenom'[0] + $user.'Nom' + $accountNumber)
        New-ADUser `
        -Name ($user.'prenom' + " " + $user.'Nom' + $accountNumber) `
        -GivenName $user.'Prenom' `
        -Surname $user.'Nom' `
        -UserPrincipalName $username `
        -SamAccountName $username `
        -AccountPassword (ConvertTo-SecureString "User@@#_0995" -AsPlainText -Force) `
        -Description $user.'Description' `
        -EmailAddress $user.'email' `
        -Title $user.'Poste' `
        -OfficePhone $user.'Telephone' `
        -Path $user.'Unite Organisation' `
        -ChangePasswordAtLogon 1 `
        -Enabled ([System.Convert]::ToBoolean($user.Enabled))
    } 
}

#See if a username is already in use. If it is, then return the number that should be appended 
#the end of the name. Else, return an empty string #for example: aba  aba2 mtoure mtoure1 ... 
function verifyUsername($username){
    $i = 1 
    #chekc if username is taken 
    if(userNameTaken($username) -eq $True){
        while(userNameTaken($username +$i) -eq $True){
            $i++
        }
    }
    else{
        return ""
    }
    return $i
}
#Check if username exist
function userNameTaken($username){

}
function ManageDisabledUser {
    #List all disable AD users 
    Search-ADAccount -AccountDisabled | Select-Object Name, DistinguishedName

    #Move all disabled AD users to disabled users OU
    Search-ADAccount -AccountDisabled | Where-Object {$_.DistinguishedName -notlike "*OU=Disabled Users*"} | Move-ADObject -TargetPath "OU=Disabled Users, OU=douam,DC=douam DC=com"
    
    #Disable all users in the disabled users OU 
    Get-ADUser -Filter { Enabled -eq $True } -SearchBase "OU=Disabled Users, OU=esgi-hafa,DC=esgi-hafa DC=fr" | Disable-ADAccount 
}
 
