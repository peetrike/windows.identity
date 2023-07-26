function Get-AccountSid {
    [OutputType([Security.Principal.SecurityIdentifier])]
    [Alias('Get-Sid')]
    [CmdletBinding()]
    param (
            [Parameter(
                ValueFromPipeline = $true,
                ValueFromPipelineByPropertyName = $true
            )]
            [string]
        $Name
    )

    process {
        if ($Name) {
            $UserObject = [Security.Principal.NTAccount] $Name
            $UserObject.Translate([Security.Principal.SecurityIdentifier])
        } else {
            [Security.Principal.WindowsIdentity]::GetCurrent().User
        }
    }
}
