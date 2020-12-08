$files = gci -Recurse -File
$files | measure -Property length -Sum -Average | select @{n = 'ComputerName'; e = {$env:COMPUTERNAME}}, Count, Sum, Average, @{n = 'Date'; e = {Get-Date}}