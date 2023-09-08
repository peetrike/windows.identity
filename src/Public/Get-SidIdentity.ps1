function Get-SidIdentity {
    [OutputType([string])]
    [CmdletBinding()]
    param (
            [parameter(
                ValueFromPipeline = $true,
                ValueFromPipelineByPropertyName = $true
            )]
            [Security.Principal.SecurityIdentifier]
        $Sid
    )

    process {
        if ($Sid) {
            $Sid.Translate([Security.Principal.NTAccount]).Value
        } else {
            [Security.Principal.WindowsIdentity]::GetCurrent().Name
        }
    }
}
