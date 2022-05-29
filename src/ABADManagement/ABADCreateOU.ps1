#Create Organizationnal Unit after reboot 
function CreateOU{
    New-ADOrganizationalUnit -Name 'gr4' 
    New-ADOrganizationalUnit -Name 'Domain Computers' -Path "OU=esgihamfa,DC=esgihamfa,DC=fr" -ProtectedFromAccidentalDeletion $True
    New-ADOrganizationalUnit -Name 'Domain Users' –Path "OU=esgihamafa,DC=esgihamfa,DC=fr"  -ProtectedFromAccidentalDeletion $True
 }
 CreateOU
