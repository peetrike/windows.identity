﻿# Implement your module commands in this script.

Write-Verbose -Message 'Initializing module windows.identity'

$Public  = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue )

#Dot source the files
foreach ($import in @($Public + $Private)) {
    try {
        . $import.FullName
    } catch {
        Write-Error -Message ('Failed to import function {0}: {1}' -f $import.FullName, $_)
    }
}

# Export only the functions in Public folder.
foreach ($function in $Public) {
    Export-ModuleMember -Function $function.BaseName
}
