function Get-CurrentUser {
    [Alias('whoami')]
    [OutputType([Security.Principal.WindowsIdentity])]
    [CmdletBinding()]
    param (
            [switch]
        $Groups,
            [switch]
        $User,
            [switch]
        $Claims,
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
