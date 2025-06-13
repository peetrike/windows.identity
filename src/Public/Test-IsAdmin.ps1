function Test-IsAdmin {
    # .EXTERNALHELP telia.windows.management-help.xml
    #[OutputType([bool])]

    $CurrentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $Role = [Security.Principal.WindowsBuiltinRole]::Administrator
    ([Security.Principal.WindowsPrincipal] $CurrentUser).IsInRole($Role)
}
