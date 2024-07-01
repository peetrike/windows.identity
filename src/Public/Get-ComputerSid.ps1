function Get-ComputerSid {
    # .EXTERNALHELP windows.identity-help.xml
    [OutputType([Security.Principal.SecurityIdentifier])]
    [CmdletBinding()]
    param ()

    # Prepare the P/Invoke signature
    try {
        $null = [Windows.Identity.Win32API+SidType]::SidTypeComputer
    } catch {
        Add-Type -TypeDefinition @'
        using System;
        using System.Runtime.InteropServices;
        using System.Text;

        namespace Windows.Identity {
            public class Win32API {
                public enum SidType {
                    SidTypeUser = 1,
                    SidTypeGroup,
                    SidTypeDomain,
                    SidTypeAlias,
                    SidTypeWellKnownGroup,
                    SidTypeDeletedAccount,
                    SidTypeInvalid,
                    SidTypeUnknown,
                    SidTypeComputer
                }

                [DllImport("advapi32.dll", SetLastError = true, CharSet = CharSet.Auto)]
                public static extern bool LookupAccountName(
                    string lpSystemName,
                    string lpAccountName,
                    byte[] Sid,
                    ref uint cbSid,
                    StringBuilder ReferencedDomainName,
                    ref uint cchReferencedDomainName,
                    out SidType peUse);
            }
        }
'@
    }

    # Prepare the parameters
    $sidLength = 24
    $sid = New-Object byte[] $sidLength
    $accountName = $env:COMPUTERNAME
    $domainNameLength = $accountName.Length + 1
    $domainName = New-Object System.Text.StringBuilder $domainNameLength
    $use = [Windows.Identity.Win32API+SidType]::SidTypeComputer

    # Call the function to get SID
    $result = [Windows.Identity.Win32API]::LookupAccountName(
        $null,
        $accountName,
        $sid,
        [ref] $sidLength,
        $domainName,
        [ref] $domainNameLength,
        [ref] $use
    )

    if ($result) {
        # Convert the byte array SID to a string SID
        New-Object -TypeName Security.Principal.SecurityIdentifier -ArgumentList $sid, 0
    } else {
        $Message = 'LookupAccountName failed with error code: {0}' -f
            [Runtime.InteropServices.Marshal]::GetLastWin32Error()
        Write-Error -Message $Message -ErrorAction Stop
    }
}
