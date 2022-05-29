function RenameServerName{
    #begin by renaming Server Name and rebooting 
    Rename-Computer -NewName DC01
    Restart-Computer -Force
}

RenameServerName
