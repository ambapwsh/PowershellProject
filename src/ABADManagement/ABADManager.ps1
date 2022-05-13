# Import the AD Module
Import-Module ActiveDirectory

# Get the path to our target CSV file
$filepath = "Please enter the path to the CSV file that contains the new user accounts"

# Import the CSV as an array
$users = Import-CSV -Path $filepath -Encoding UTF8

# Complete an action for each user in the CSV file
ForEach ($user in $users) {
    # Do this for each user
    $accountNumber = verifyUsername($user.'FirstName'[0] + $user.'LastName')
    $username = ($user.'FirstName'[0] + $user.'LastName' + $accountNumber)
    $password = $user.'Password'
    New-ADUser `
        -Name ($user.'FirstName' + " " + $user.'LastName' + " " + $accountNumber) `
        -GivenName $user.'FirstName' `
        -Surname $user.'LastName' `
        -DisplayName $user.'FirstName' + " " + $user.'LastName'
        -UserPrincipalName $username `
        -SamAccountName $username `
        -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) `
        -Description $user.Description `
        -EmailAddress $user.'EmailAddress' `
        -Title $user.'JobTitle' `
        -OfficePhone $user.'OfficePhone' `
        -Path $user.'OrganizationalUnit' `
        -ChangePasswordAtLogon 1 `
        -Enabled ([System.Convert]::ToBoolean($user.Enabled))
}

# See if a username is already in use. If it is, then return the number that should be appended 
# the end of the name. Else, return an empty string (example: phill, phill1, phill2 etc...)
function verifyUsername($username) {
    $i = 1 

    # See if username is taken (or in use)
    if (userNameTaken($username) -eq $True) {
        while (userNameTaken($username + $i) -eq $True) {
            $i++
        }
    } else {
        return ""
    }
    return $i
}

# Check to see if username already exists
function userNameTaken($username) {
    $test1 = Get-ADUser -Filter { userPrincipalName -eq $username } 
    $test2 = Get-ADUser -Filter { samAccountName -eq $username }

    if($test1 -eq $Null -and $test2 -eq $Null) {
        return $False
    } else {
        return $True
    }
}
