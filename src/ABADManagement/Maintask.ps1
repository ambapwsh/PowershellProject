$aruguments = @(" C:\Users\aba\Desktop\PWSH+1\PowershellProject\src\ADABManagement\ADDeploy.ps1", "C:\Users\aba\Desktop\PWSH+1\PowershellProject\src\ADABManagement\ADManager.ps1", "") 
$policy= "-ExecutionPolicy Bypass"
function ExecTask{
    $scriptsList = 
    @(
        'C:\Users\aba\Desktop\PWSH+1\PowershellProject\src\ADABManagement\ABADRenameServer.ps1'
        'C:\Users\aba\Desktop\PWSH+1\PowershellProject\src\ADABManagement\ABADDeploy.ps1'
        'C:\Users\aba\Desktop\PWSH+1\PowershellProject\src\ADABManagement\ABADInstallForest.ps1'
        'C:\Users\aba\Desktop\PWSH+1\PowershellProject\src\ADABManagement\ABADCreateOU.ps1'
        'C:\Users\aba\Desktop\PWSH+1\PowershellProject\src\ADABManagement\ADManager.ps1'
        
    )
    
    foreach($script in $scriptsList)
    {
        Start-Process -FilePath "$PSHOME\powershell.exe" -ArgumentList "-command '& $script'" + "" + $policy -Wait
    }
}

ExecTask

