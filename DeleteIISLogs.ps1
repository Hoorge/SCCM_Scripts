<#
.SYNOPSIS
    Delete older Log-Files from the IIS (C:\inetpub\logs\LogFiles\W3SVC1)
.DESCRIPTION
    The IIS Log-Files are full fill the C:\ Drive if there is no cleaning Job.
    In this Script we will clean the C:\inetpub\logs\LogFiles\W3SVC1 folder from Logfiles that
    are older than 10 Days, in this case the Logs should be enough for Troubleshooting.
    This script is also implemented to the Scheduled Tasks and run dayli
.PARAMETER 
    NONE
.EXAMPLE
    powershell.exe -ExecutionPolicy Bypass -file DeleteIISLogs.ps1
.NOTES
    Script name: DeleteIISLogs.ps1
    Version:     1.0
    Author:      Mirko Colemberg // baseVISION AG
    DateCreated: 2017-03-08
        #>

##################################################################################
# Define the target path
##################################################################################
$path1 = "C:\inetpub\logs\LogFiles\W3SVC1\"
$path2 = "C:\inetpub\logs\LogFiles\W3SVC200163892"

##################################################################################
# delete Files older than 10 Days
##################################################################################
Get-ChildItem -Path $path1 -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt (Get-Date).AddDays(-10) } | Remove-Item -Force
Get-ChildItem -Path $path2 -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt (Get-Date).AddDays(-10) } | Remove-Item -Force
