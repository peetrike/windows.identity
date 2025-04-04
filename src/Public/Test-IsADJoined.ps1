function Test-IsADJoined {
    [CmdletBinding()]
    param (
            [Alias('Entra')]
            [switch]
        $AzureAD
    )

    # Prepare the P/Invoke signature
    try {
        $null = [Windows.Identity.NetJoinStatus]
    } catch {
        Add-Type -TypeDefinition @'
        using System;
        using System.Runtime.InteropServices;

        namespace Windows.Identity {
            public enum NetJoinStatus {
                NetSetupUnknownStatus = 0,
                NetSetupUnjoined,
                NetSetupWorkgroupName,
                NetSetupDomainName
            }

            public class AD {
                [DllImport("Netapi32.dll", CharSet=CharSet.Unicode, SetLastError=true)]
                public static extern int NetGetJoinInformation(
                    string server,
                    out IntPtr domain,
                    out NetJoinStatus status);

                [DllImport("Netapi32.dll")]
                public static extern int NetApiBufferFree(IntPtr Buffer);
            }
        }
'@
    }

    $domain = [IntPtr]::Zero
    $status = [Windows.Identity.NetJoinStatus]::NetSetupUnknownStatus
    try {
        $result = [Windows.Identity.AD]::NetGetJoinInformation(
            $null,
            [ref] $domain,
            [ref] $status
        )
        if ($result -eq 0) {
            if ($status -gt [Windows.Identity.NetJoinStatus]::NetSetupUnjoined) {
                $target = switch ($status) {
                    ([Windows.Identity.NetJoinStatus]::NetSetupWorkgroupName) { 'Workgroup' }
                    ([Windows.Identity.NetJoinStatus]::NetSetupDomainName) { 'Domain' }
                }
                $name = [Runtime.InteropServices.Marshal]::PtrToStringUni($domain)
                Write-Verbose -Message ('{0} Name: {1}' -f $target, $name)
            }
            $status -eq [Windows.Identity.NetJoinStatus]::NetSetupDomainName
        }
    } catch {
        throw
    } finally {
        if ($domain -ne [IntPtr]::Zero) {
            $null = [Windows.Identity.AD]::NetApiBufferFree($domain)
        }
    }
}
