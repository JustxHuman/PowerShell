<#
.SYNOPSIS
    Create a tree-like display of all processes.

.DESCRIPTION
    Create a tree-like display of all processes.
.PARAMETER 

.PARAMETER 

.Notes

Steps:
 1. Get all parent processes
    a. How do we find which processes are parents vs children?
        List all processes and sort by ProcessID(we assume in most cases the lower the PID the more likely it's a parent)
        Each Process is given its own custom object to store children
        -OR-
        Start with all processes which have a parent of Explorer or Services
        Examine the remaining processes parent IDs to determine what they point to or if orphaned

        
 2. Get the children of each parent

#>

function FunctionName {
    [CmdletBinding()]

    param(

    )


}