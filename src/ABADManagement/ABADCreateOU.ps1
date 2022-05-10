#Create Organizationnal Unit after reboot 
function CreateOU{
    $ou = New-ADOrganizationalUnit Finance –Path 'OU=Domain Users,DC=esgihamfa,DC=fr' 
     -ProtectedFromAccidentalDeletion $True
     return $ou
 }
 CreateOU
 