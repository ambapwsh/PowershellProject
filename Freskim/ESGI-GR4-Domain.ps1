#====================== ADD domain

$domain = "gr4.local"
$login = "gr4\admgr4"
$mdp = ConvertTo-SecureString "P@ssword" -AsPlainText -Force
$UserPassword = New-Object System.Management.Automation.PSCredential($login,$mdp)

Add-Computer -DomainName $domain -Credential $UserPassword




<#
function verifiersibesoinredemarrage {
$servername = hostname
Invoke-Command -ComputerName $servername -ScriptBlock { 
     if (Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending" -EA Ignore) { return $true }
     if (Get-Item "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired" -EA Ignore) { return $true }
     if (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" -Name PendingFileRenameOperations -EA Ignore) { return $true }
     try { 
       $util = [wmiclass]"\\.\root\ccm\clientsdk:CCM_ClientUtilities"
       $status = $util.DetermineIfRebootPending()
       if(($status -ne $null) -and $status.RebootPending){
         return $true
       }
     }catch{}
 
     return $false

}
}


Do{
    $StatusVM = verifiersibesoinredemarrage
}until ($StatusVM -eq "Ready")
if($StatusVM -eq "Ready"){
    Restart-Computer
    exit
}
#>