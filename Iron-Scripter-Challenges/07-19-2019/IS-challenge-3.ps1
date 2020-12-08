<#
.SYNOPSIS

.DESCRIPTION

.PARAMETER Path
Accepts multiple paths from C: drive.

.PARAMETER Exclude
Allow exclusion of file types.

.Notes
When [ValidateDrive] was used, I was unable to set the parameter type to String[].  Further investigation needed.

Unable to elegantly show Sum as KB/MB since I'm currently running PS 5.1.  PS 6 Measure-Object added a script block feature for '-Sum' like '{$_.length/1KB}' 

Will come back to adding a progress bar for each path.  Since GCI does all the work, it's hard to gauge the progress.

Error Handling:
Not all Exceptions are terminating.
A non-terminating exception can be made to terminate using ErrorAction -Stop
Using ErrorAction -Stop still does not allow you to catch a specific exception.

#>

function IS-challenge-3()
{
    [CmdletBinding()]
    [Alias("IS3")]
        
        param (
            [Parameter(ValueFromPipeline = $true)]
            [ValidateNotNullOrEmpty()]
            [ValidateScript({if(!(Test-Path $_)){Write-Warning "Path does not exist"}else{return $true}})]
            [String[]]
            $Path,
            [String[]]
            $Exclude
        )

    Begin{}
    Process
    {
        if($PSBoundParameters.ContainsKey('Exclude'))
        {
            Write-Debug "Found Key"
            $cmd = {Get-ChildItem -Path $dir -Recurse -File -Force -Exclude $Exclude -ErrorAction SilentlyContinue}
        }
        else {
            Write-Debug "No key"
            $cmd = {Get-ChildItem -Path $dir -Recurse -File -Force -ErrorAction SilentlyContinue}
        }
        foreach($dir in $Path) {
                $files = & $cmd
                
                $fObject = [PSCustomObject]@{
                    Date = Get-Date
                    ComputerName = $env:COMPUTERNAME
                    Path = $dir
                    ttlFiles = ($files.Length).ToString("N0")
                    hiddenFiles = $files | Where-Object -Property Attributes -Match 'hidden' | Measure-Object | Select-Object -ExpandProperty Count
                    ttlSize = (($files |Measure-Object -Property length -Sum | Select-Object -ExpandProperty Sum)/1MB).toString("N2")+ " MB"
                }
                $fObject | Format-List
        }#foreach
    }#process
}#function