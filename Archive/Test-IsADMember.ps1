function Test-IsADMember {
    # .EXTERNALHELP telia.windows.management-help.xml
    #[OutputType([bool])]
    [CmdletBinding()]
    param ()

    $property = 'PartofDomain'
    $cimObject = ([wmisearcher] "SELECT * FROM Win32_ComputerSystem").Get() |
        ForEach-Object { $_ }
    $result = $cimObject.$property
    $target = if ($result) { 'Domain' } else { 'Workgroup' }
    Write-Verbose -Message ('{0} Name: {1}' -f $target, $cimObject.$target)
    $result
}
