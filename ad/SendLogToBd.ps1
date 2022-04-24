function Export-Logons-ToPSQL {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$True)]
        [String]$UserName,
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$True)]
        [String]$ComputerName,
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$True)]
        [String]$Action,
        [Parameter(Mandatory=$false,
                   ValueFromPipelineByPropertyName=$True)]
        [String]$LogonType,
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$True)]
        [DateTime]$TimeStamp,
        [Parameter(Mandatory=$false,
                   ValueFromPipelineByPropertyName=$false)]
        [String]$LogFile = ''
    )
    
    BEGIN {
        # Check that log file path is valid, if given.
        if ($LogFile -eq '') {
            $logToFile = $false
        } else {
            try {
                $pathToLogFile = Split-Path -Parent -Path $LogFile
            } catch {
                Write-Error $_
                break
            }
            if (Test-Path $pathToLogFile) {
                $logToFile = $true
            } else {
                Write-Error "Invalid path to log file specified."
                break
            }
        }
        
        # If logging, begin writing to logfile.
        if ($logToFile) {
            $date = Get-Date
            "[$date]" | Out-File -FilePath $LogFile -Encoding ASCII -Append -NoClobber
        }
        
        # Create and prep DB connection objects and establish connection.
        $DBConn = New-Object System.Data.Odbc.OdbcConnection('DSN=Psql_logondb')
        $DBCmd = $DBConn.CreateCommand()
        $DBCmd.CommandText = 'INSERT INTO logons (username,compname,logontype,action,date,time)'
        $DBCmd.CommandText += ' VALUES (?,?,?,?,?,?);'
        [void]$DBCmd.Parameters.Add('@username', [System.Data.Odbc.OdbcType]::varchar, 20)
        [void]$DBCmd.Parameters.Add('@compname', [System.Data.Odbc.OdbcType]::varchar, 20)
        [void]$DBCmd.Parameters.Add('@logontype', [System.Data.Odbc.OdbcType]::varchar, 10)
        [void]$DBCmd.Parameters.Add('@action', [System.Data.Odbc.OdbcType]::varchar, 10)
        [void]$DBCmd.Parameters.Add('@date', [System.Data.Odbc.OdbcType]::date)
        [void]$DBCmd.Parameters.Add('@time', [System.Data.Odbc.OdbcType]::time)
        $newRows = $oldRows = $errRows = 0
        try {
            $DBCmd.Connection.Open()
        } catch {
            if ($logToFile) {
                $_ | Out-File -FilePath $LogFile -Encoding ASCII -Append -NoClobber
            } else {
                Write-Error $_
            }
            break
        }
    }
    
    PROCESS {
        # Parse data and attempt to insert a row into the database.
        [DateTime]$date = $TimeStamp.date
        [TimeSpan]$time = Get-Date $TimeStamp -Format 'HH:mm:ss'
        $DBCmd.Parameters['@username'].Value = $UserName
        $DBCmd.Parameters['@compname'].Value = $ComputerName
        $DBCmd.Parameters['@logontype'].Value = $LogonType
        $DBCmd.Parameters['@action'].Value = $Action
        $DBCmd.Parameters['@date'].Value = $date
        $DBCmd.Parameters['@time'].Value = $time
        try {
            [void]$DBCmd.ExecuteNonQuery()
            $newRows = $newRows + 1
        } catch {
            $uniqueErr = '*ERROR `[23505`] ERROR: duplicate key value violates unique constraint*'
            if ($_.exception -like $uniqueErr) {
                $oldRows = $oldRows + 1
            } else {
                if ($logToFile) {
                    $_ | Out-File -FilePath $LogFile -Encoding ASCII -Append -NoClobber
                } else {
                    Write-Error $_
                }
                $errRows = $errRows + 1
            }
        }
    }
    
    END {
        $DBCmd.Connection.Close()
        if ($logToFile) {
            "$newRows new rows written to database." | Out-File -FilePath $LogFile -Encoding ASCII -Append -NoClobber
            "$oldRows existing rows discarded." | Out-File -FilePath $LogFile -Encoding ASCII -Append -NoClobber
            "$errRows rows failed to insert for unknown reasons." | Out-File -FilePath $LogFile -Encoding ASCII -Append -NoClobber
        } else {
            if ($newRows) { Write-Host "$newRows new rows written to database." }
            if ($oldRows) { Write-Host "$oldRows existing rows discarded." }
            if ($errRows) { Write-Host "$errRows rows failed to insert for unknown reasons." }
        }
    }
}