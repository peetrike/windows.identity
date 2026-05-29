function Test-IsAdmin {
    # .EXTERNALHELP telia.windows.management-help.xml
    [OutputType([bool])]
    [CmdletBinding()]
    param ()

    if ($PSVersionTable.PSVersion -lt '5.1' -or $PSEdition -eq 'Desktop' -or $IsWindows) {
        $CurrentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
        $Role = [Security.Principal.WindowsBuiltinRole]::Administrator
        ([Security.Principal.WindowsPrincipal] $CurrentUser).IsInRole($Role)
    } else {
        (id -u) -eq 0
    }
}
