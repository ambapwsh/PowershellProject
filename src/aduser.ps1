#adding function to deploy ad user
#variables
$currentDate = Get-Date
$endDate = $currentDate.AddYears(1)
$notAfter = $endDate.AddYears(1)
$pwd = "<password>"
$pwd = ConvertTo-SecureString -String $pwd -Force -AsPlainText
function Create-AzureADApplication{
    $application = New-AzureADApplication
     -DisplayName "test123" -IdentifierUris "https://test123"
     New-AzureADApplicationKeyCredential -ObjectId $application.ObjectId
    -CustomKeyIdentifier "Test123" -StartDate $currentDate -EndDate $endDate
     -Type AsymmetricX509Cert -Usage Verify -Value $keyValue
    #$aduser = New-AdUser
    #write-Output $aduser
}

function Create-MainService{
    $sp=New-AzureADServicePrincipal -AppId $application.AppId
    Add-AzureADDirectoryRoleMember -ObjectId 5997d714-c3b5-4d5b-9973-ec2f38fd49d5 
    -RefObjectId $sp.ObjectId
    $tenant=Get-AzureADTenantDetail
}
function ConnectToAzureAd{
   return $connnect = Connect-AzureAD -TenantId $tenant.ObjectId -ApplicationId  $sp.AppId
}

function Set-AdUser{
    $user = New-ADUser `
    -Name "Kevin Sapp" `
    -GivenName "Kevin" `
    -Surname "Sapp" `
    -SamAccountName "kesapp-test" `
    -AccountPassword (Read-Host -AsSecureString "Input User Password") `
    -ChangePasswordAtLogon $True `
    -Company "Code Duet" `
    -Title "CEO" `
    -State "California" `
    -City "San Francisco" `
    -Description "Test Account Creation" `
    -EmployeeNumber "45" `
    -Department "Engineering" `
    -DisplayName "Kevin Sapp (Test)" `
    -Country "us" `
    -PostalCode "940001" `
    -Enabled $True
}
function Get-AdUser{
 import-module ActiveDirectory
 $users = Get-AdUser -Filter * -SearchBase "OU=SERVERNAME FOLLOW BY AD NAME,DC="""   
 $sourceUser = Get-AdUser -Identity "username" -Properties MemberOf
 $sourceGroups = $sourceUser.MemberOf 
 #iterate on each Ad GROUP
}



#Users creation 
# Import active directory module for running AD cmdlets
Import-Module ActiveDirectory
  
# Store the data from NewUsersFinal.csv in the $ADUsers variable
$ADUsers = Import-Csv C:\temp\NewUsersFinal.csv -Delimiter ";"

# Define UPN
$UPN = "douam.com"

# Loop through each row containing user details in the CSV file
foreach ($User in $ADUsers) {

    #Read user data from each field in each row and assign the data to a variable as below
    $username = $User.username
    $password = $User.password
    $firstname = $User.firstname
    $lastname = $User.lastname
    $initials = $User.initials
    $OU = $User.ou #This field refers to the OU the user account is to be created in
    $email = $User.email
    $streetaddress = $User.streetaddress
    $city = $User.city
    $state = $User.state
    $country = $User.country
    $telephone = $User.telephone
    $jobtitle = $User.jobtitle
    $company = $User.company
    $department = $User.department

    # Check to see if the user already exists in AD
    if (Get-ADUser -F { SamAccountName -eq $username }) {
        
        # If user does exist, give a warning
        Write-Warning "A user account with username $username already exists in Active Directory."
    }
    else {

        # User does not exist then proceed to create the new user account
        # Account will be created in the OU provided by the $OU variable read from the CSV file
        New-ADUser `
            -SamAccountName $username `
            -UserPrincipalName "$username@$UPN" `
            -Name "$firstname $lastname" `
            -GivenName $firstname `
            -Surname $lastname `
            -Initials $initials `
            -Enabled $True `
            -DisplayName "$lastname, $firstname" `
            -Path $OU `
            -City $city `
            -PostalCode $zipcode `
            -Country $country `
            -Company $company `
            -State $state `
            -StreetAddress $streetaddress `
            -OfficePhone $telephone `
            -EmailAddress $email `
            -Title $jobtitle `
            -Department $department `
            -AccountPassword (ConvertTo-secureString $password -AsPlainText -Force) -ChangePasswordAtLogon $True

        # If user is created, show message.
        Write-Host "The user account $username is created." -ForegroundColor Cyan
    }
}

Read-Host -Prompt "Press Enter to exit"