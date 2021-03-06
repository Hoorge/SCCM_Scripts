<#
.SYNOPSIS
    Delete older Files from the WSUS, WSUS-Cleanup
.DESCRIPTION
    The WSUS stores all the meta data for all Patches that are selected, 
    to clean up Expired or Old Patches especially SCEP Updates, this script will
    be run in a scheduled task every day to delete the older meta data.
.PARAMETER 
    NONE
.EXAMPLE
    powershell.exe -ExecutionPolicy Bypass -WSUS_CleanUp.ps1 -SRV <localhost>
.NOTES
    Script name: WSUS_CleanUp.ps1
    Version:     1.0
    Author:      Mirko Colemberg // baseVISION AG
    DateCreated: 2017-03-08
#>

##################################################################################
# Define the target path
##################################################################################
Param($SRV = "localhost")

Get-WsusServer -Name $SRV -PortNumber 8530

Get-WsusServer | Invoke-WsusServerCleanup –CleanupObsoleteUpdates -CleanupUnneededContentFiles -CompressUpdates -DeclineExpiredUpdates -DeclineSupersededUpdates


