# Import the AD Module
Import-Module ActiveDirectory

# Get the path to our target CSV file
$filepath = Read-Host -Prompt "You have to edit file path"

# Import the CSV as an array
$users = Import-CSV -Path $filepath -Encoding UTF8

# Complete an action for each user in the CSV file
ForEach ($user in $users) {
    # Do this for each user
    New-ADUser `
        -Name ($user.'FirstName' + " " + $user.'LastName') `
        -GivenName $user.'FirstName' `
        -Surname $user.'LastName' `
        -UserPrincipalName ($user.'FirstName' + "." + $user.'LastName') `
        -AccountPassword (ConvertTo-SecureString "Admin2021" -AsPlainText -Force) `
        -Description $user.Description `
        -EmailAddress $user.'EmailAddress' `
        -Title $user.'JobTitle' `
        -OfficePhone $user.'OfficePhone' `
        -Path $user.'OrganizationalUnit' `
        -ChangePasswordAtLogon 1 `
        -Enabled ([System.Convert]::ToBoolean($user.Enabled))
}