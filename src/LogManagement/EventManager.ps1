function Get-WinLogonHistory { 
    $html = [System.Collections.ArrayList]@()
    $logons = Get-EventLog -LogName Security -AsBaseObject -InstanceId 4624,4647, 4634 | 
              Where-Object { ($_.InstanceId -eq 4647) -or ($_.InstanceID -eq 4634 ) -or (($_.InstanceId -eq 4624) -and ($_.Message -match "Logon Type:\s+2")) -or (($_.InstanceId -eq 4624) -and ($_.Message -match "Logon Type:\s+10")) } 
    #$poweroffs = Get-EventLog System -AsBaseObject -InstanceId 41
    $powers = Get-EventLog -LogName System -After (Get-Date).AddDays(-1) -Before $(Get-Date) | Where-Object {($_.EventID -eq 1074) -or ($_.EventID -eq 41) -or ($_.EventID -eq 6006) -or ($_.EventID -eq 6008)} | Select-Object EventID,TimeGenerated,Message 
    $events = $logons + $powers | Sort-Object TimeGenerated 
    $a = "<style>"
    $a = $a + "BODY{background-color:LightGray; text-align: center; position:absolute; left:30%; top:20%;}"
    $a = $a + "TABLE{border-width: 1px;border-style: solid;border-color:  black;border-collapse: collapse;}"
    $a = $a + "TH{column-width: 200px;border-width: 1px;padding: 8px;border-style: solid;border-color: black;background-color:thistle;  color: blue}"
    $a = $a + "TD{column-width: 200px;border-width: 1px;padding: 3px;border-style: solid;border-color: black;background-color:PaleGoldenrod;text-align: center}"
    $a = $a + "</style>"
    if ($events) { 
        foreach($event in $events) { 
            # Parse logon data from the Event. 
            if ($event.InstanceId -eq 4624) { 
                # A user logged on. 
                $action = 'logon' 
                $event.Message -match "Logon Type:\s+(\d+)" 

                $logonTypeNum = $matches[1] 
                # Determine logon type. 
                if ($logonTypeNum -eq 2) { 
                    $logonType = 'console' 
                } elseif ($logonTypeNum -eq 10) { 
                    $logonType = 'remote' 
                } elseif ($logonTypeNum -eq 3) {

                    $logonType = 'other' 
                } 
                 
                # Determine user. 
                if ($event.message -match "New Logon:\s*Security ID:\s*.*\s*Account Name:\s*(\w+)") { 
                    $user = $matches[1] 
                } else { 
                    $index = $event.index 
                    Write-Warning "Unable to parse Security log Event. Malformed entry? Index: $index" 
                } 
                 
            } elseif (($event.InstanceId -eq 4647) -or ($event.InstanceID -eq 4634)) { 
                # A user logged off. 
                $action = 'logoff' 
                $logonType = ""
                # Determine user. 
                if ($event.message -match "Subject:\s*Security ID:\s*.*\s*Account Name:\s*(\w+)") { 
                    $user = $matches[1] 
                } else { 
                    $index = $event.index 
                    Write-Warning "Unable to parse Security log Event. Malformed entry? Index: $index" 
                } 
            } elseif ($event.InstanceId -eq 41) { 
                # The computer crashed. 
                $action = 'logoff' 
                $logonType = $Null 
                $user = '*' 
            } elseif 
                (($event.InstanceID) -eq 1074 -or ($event.InstanceId) -eq 6006 ) {
                    #The computer restart 
                    $action = 'restart' 
                    Write-Warning "restart initialised by" $user 
                } elseif ($event.InstanceID -eq 6008){
                    #System restart due to crash 
                    Write-Information "log services was restarted"
                }
            
            # As long as we managed to parse the Event, print output. 
            if ($user) { 
                $timeStamp = Get-Date $event.TimeGenerated 
                $output = New-Object -Type PSCustomObject 
                Add-Member -MemberType NoteProperty -Name 'UserName' -Value $user -InputObject $output 
                Add-Member -MemberType NoteProperty -Name 'ComputerName' -Value $env:computername -InputObject $output 
                Add-Member -MemberType NoteProperty -Name 'Action' -Value $action -InputObject $output 
                Add-Member -MemberType NoteProperty -Name 'LogonType' -Value $logonType -InputObject $output 
                Add-Member -MemberType NoteProperty -Name 'TimeStamp' -Value $timeStamp -InputObject $output           
            } 
           
            #$outputs=@()
            #outputs = $output
            $html.Add($output)
            Write-Output $html
            $html | ConvertTo-Html -As Table -Title "log management" -Head $a| Out-File Management.html 
            #foreach ($out in $output){
            #    $result = Write-Output $output
            #} 
            #$file = ConvertTo-Html -Body "$result" | Out-file -FilePath test5.html 
        } 
            
       

        #foreach ($out in $output){
           #    $result = Write-Output $out
         #  $file = ConvertTo-Html -Body "$result" | Out-file -FilePath test5.html -Append
   # } else { 
     #   Write-Host "No recent logon/logoff events." 
    } 
} 

Get-WinLogonHistory 

#function getADuserLog($username){
 #   Get-WinLogonHistory 
  #  if($output.UserName -eq $username){
    #username of host machine here 
  #}
  #else {
    #write-Output ""L'utilisateur que vous recherchez n'existe pas
  #}
#}