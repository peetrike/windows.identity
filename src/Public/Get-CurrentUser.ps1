function Get-CurrentUser {
    # .EXTERNALHELP windows.identity-help.xml
    [Alias('whoami')]
    [OutputType([Security.Principal.WindowsIdentity])]
    [OutputType([PSCustomObject], ParameterSetName = ('Privileges', 'Groups', 'User'))]
    [CmdletBinding(
        DefaultParameterSetName = 'All'
    )]
    param (
            [Parameter(
                ParameterSetName = 'Groups'
            )]
            [switch]
        $Groups,
            [Parameter(
                ParameterSetName = 'User'
            )]
            [switch]
        $User,
            [Parameter(
                ParameterSetName = 'Claims'
            )]
            [switch]
        $Claims,
            [Parameter(
                ParameterSetName = 'Privileges'
            )]
            [switch]
        $Privileges
    )

    $Identity = [Security.Principal.WindowsIdentity]::GetCurrent()

    switch ($PSBoundParameters.Keys) {
        'Groups' {
            $Identity.Groups | ForEach-Object {
                $Sid = [Security.Principal.SecurityIdentifier] $_
                New-Object -TypeName PSObject -Property @{
                    Name = $Sid.Translate([Security.Principal.NTAccount]).Value
                    Sid  = $Sid
                }
            }
        }
        'User' {
            #$Identity | Select-Object -Property Name, User
            New-Object -TypeName PSObject -Property @{
                Name = $Identity.Name
                SID  = $Identity.User
            }
        }
        'Claims' {
            $Identity.UserClaims
        }
        'Privileges' {
            whoami.exe /priv /fo csv /nh |
                ConvertFrom-Csv -Header 'Privilege', 'Description', 'State'
        }
    }
    if (-not $PSBoundParameters.Count) {
        $Identity
    }
}
