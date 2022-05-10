function RenameServerName{
    #begin by renaming Server Name and rebooting 
    Rename-Computer -NewName DOUAMDC01
    Restart-Computer -Force
}

RenameServerName
