function Get-SidIdentity {
    [OutputType([string])]
    [CmdletBinding()]
    param (
            [parameter(
                ValueFromPipeline = $true,
                ValueFromPipelineByPropertyName = $true
            )]
            [Security.Principal.SecurityIdentifier]
        $Sid = [Security.Principal.WindowsIdentity]::GetCurrent().User
    )

    process {
        $Sid.Translate([Security.Principal.NTAccount]).Value
    }
}
