<#
.SYNOPSIS
    Obtain top-level directories sizes for the provided Path.
.DESCRIPTION
    Obtain top-level directories sizes for the provided Path.
.PARAMETER Path
    The location you want to examine
.PARAMETER

.Notes

#>

function Get-DirInfo {
    [CmdletBinding()]

    param (
        [Parameter(ValueFromPipeline = $true)]
        [string]
        $Path
    )

    Begin{
        $Dirs = @{}
    }

    Process{
        #Create list of top-level folders
        $folders = Get-ChildItem $Path -Directory
        

        foreach ($dir in $folders) {
            $values = [PSCustomObject]@{
                Folder = $dir.Name
                Path   = $dir
                Size   = ((Get-ChildItem $dir.FullName -File -Recurse | Measure-Object -Property Length -Sum | Select-Object -ExpandProperty Sum)/1MB).toString("N0") + " MB"
            }
            $values
        }#endForEach        
    }#endProcess
}#endFunction