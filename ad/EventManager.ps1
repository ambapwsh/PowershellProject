function Get-WinLogonHistory { 
    $logons = Get-EventLog Security -AsBaseObject -InstanceId 4624,4647 | 
              Where-Object { ($_.InstanceId -eq 4647) -or (($_.InstanceId -eq 4624) -and ($_.Message -match "Logon Type:\s+2")) -or (($_.InstanceId -eq 4624) -and ($_.Message -match "Logon Type:\s+10")) } 
    $poweroffs = Get-EventLog System -AsBaseObject -InstanceId 41 
    $events = $logons + $poweroffs | Sort-Object TimeGenerated 
     
    if ($events) { 
        foreach($event in $events) { 
            # Parse logon data from the Event. 
            if ($event.InstanceId -eq 4624) { 
                # A user logged on. 
                $action = 'logon' 
                 
                $event.Message -match "Logon Type:\s+(\d+)" | Out-Null 
                $logonTypeNum = $matches[1] 
                 
                # Determine logon type. 
                if ($logonTypeNum -eq 2) { 
                    $logonType = 'console' 
                } elseif ($logonTypeNum -eq 10) { 
                    $logonType = 'remote' 
                } else { 
                    $logonType = 'other' 
                } 
                 
                # Determine user. 
                if ($event.message -match "New Logon:\s*Security ID:\s*.*\s*Account Name:\s*(\w+)") { 
                    $user = $matches[1] 
                } else { 
                    $index = $event.index 
                    Write-Warning "Unable to parse Security log Event. Malformed entry? Index: $index" 
                } 
                 
            } elseif ($event.InstanceId -eq 4647) { 
                # A user logged off. 
                $action = 'logoff' 
                $logonType = $null 
                 
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
                $logonType = $null 
                $user = '*' 
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
                Write-Output $output 
            } 
        } 
    } else { 
        Write-Host "No recent logon/logoff events." 
    } 
} 


Get-WinLogonHistory 