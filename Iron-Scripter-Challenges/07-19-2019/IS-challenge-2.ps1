<#
.SYNOPSIS

.DESCRIPTION

.PARAMETER Path
Accepts a single path from C: drive.

.Notes
Since [ValidateDrive] was used, I was unable to set the parameter type to String[].  I will need to investigate this further

Error Handling:
Not all Exceptions are terminating.
A non-terminating exception can be made to terminate using ErrorAction -Stop
Using ErrorAction -Stop still does not allow you to catch a specific exception.

#>

function IS-challenge-2()
{
    [CmdletBinding()]
        
        param (
            [Parameter(ValueFromPipeline = $true)]
            [ValidateNotNullOrEmpty()]
            [String[]]
            $Path
        )

    Begin
    {

    }
    Process
    {
        foreach($dir in $Path) {
            try {
                $files = Get-ChildItem -Path $dir -Recurse -File -ErrorAction Stop
                $files | Measure-Object -Property length -Sum -Average | Select-Object @{n = 'ComputerName'; e = {$env:COMPUTERNAME}}, @{l = "Path"; e = {$dir}}, Count, Sum, Average, @{n = 'Date'; e = {Get-Date}}
            }
            catch [UnauthorizedAccessException] {
                Write-Warning "Access Denied."                
            }
            catch {
                Write-Warning "Path not found."
            }
        }#foreach
    }#process
}#function