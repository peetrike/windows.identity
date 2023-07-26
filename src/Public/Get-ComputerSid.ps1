function Get-ComputerSid {
    [OutputType([Security.Principal.SecurityIdentifier])]
    [CmdletBinding()]
    param ()

    try {
        (Get-LocalUser -ErrorAction Stop | Select-Object -First 1).Sid.AccountDomainSid
    } catch {
        $ClassName = 'Win32_UserAccount'
        $QueryParams = @{
            Filter = 'LocalAccount=True'
        }
        if ($cmd = Get-Command Get-CimInstance -ErrorAction SilentlyContinue) {
            $QueryParams.ClassName = $ClassName
        } else {
            $cmd = Get-Command Get-WmiObject
            $QueryParams.Class = $ClassName
        }

        $Object = & $cmd @QueryParams | Select-Object -First 1
        ([Security.Principal.SecurityIdentifier]$Object.Sid).AccountDomainSid
    }
}
