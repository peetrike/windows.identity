function Get-CurrentUser {
    [Alias('whoami')]
    [OutputType([Security.Principal.WindowsIdentity])]
    #[OutputType([Security.Claims.Claim], ParameterSetName = 'Claims')]
    [OutputType([PSCustomObject], ParameterSetName = ('Privieges', 'Groups'))]
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
                @{
                    Name = Get-SidIdentity -Sid $_
                    SID  = $_
                } | New-PSObject
            }
        }
        'User' {
            $Identity | Select-Object -Property Name, Sid
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
