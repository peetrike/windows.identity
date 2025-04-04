function Test-IsEntraJoined {
    <#
        .LINK
            https://github.com/DeployWindowsCom/DeployWindows-Scripts/blob/master/Azure%20AD/Get-AadJoinInformation.ps1
    #>
    [CmdletBinding()]
    param (
            [string]
        $TenantId
    )

    if ([Environment]::OSVersion.Version.Major -lt 10) {
        throw 'This function is only supported on Windows 10 and later.'
    }

    # Prepare the P/Invoke signature
    try {
        $null = [Windows.Identity.Entra]
    } catch {
        Add-Type -TypeDefinition @'
        using System;
        using System.Runtime.InteropServices;

        namespace Windows.Identity {
            public class Entra {
                public enum JoinType {
                    Unknown,
                    DeviceJoin,
                    Workplace_Join
                }

                [StructLayout(LayoutKind.Sequential, CharSet=CharSet.Unicode)]
                public struct JoinInfo {
                    public JoinType joinStatus;
                    public IntPtr pJoinCertificate;
                    [MarshalAs(UnmanagedType.LPWStr)] public string DeviceId;
                    [MarshalAs(UnmanagedType.LPWStr)] public string IdpDomain;
                    [MarshalAs(UnmanagedType.LPWStr)] public string TenantId;
                    [MarshalAs(UnmanagedType.LPWStr)] public string JoinUserEmail;
                    [MarshalAs(UnmanagedType.LPWStr)] public string TenantDisplayName;
                    [MarshalAs(UnmanagedType.LPWStr)] public string MdmEnrollmentUrl;
                    [MarshalAs(UnmanagedType.LPWStr)] public string MdmTermsOfUseUrl;
                    [MarshalAs(UnmanagedType.LPWStr)] public string MdmComplianceUrl;
                    [MarshalAs(UnmanagedType.LPWStr)] public string UserSettingSyncUrl;
                    public IntPtr pUserInfo;
                }

                [DllImport("netapi32.dll", CharSet=CharSet.Unicode, SetLastError=true)]
                public static extern void NetFreeAadJoinInformation(IntPtr pJoinInfo);

                [DllImport("netapi32.dll", CharSet=CharSet.Unicode, SetLastError=true)]
                public static extern int NetGetAadJoinInformation(
                    [MarshalAs(UnmanagedType.LPWStr)] string pcszTenantId,
                    out IntPtr ppJoinInfo);
            }
        }
'@
    }

    $JoinPointer = [IntPtr]::Zero
    try {
        $result = [Windows.Identity.Entra]::NetGetAadJoinInformation($TenantId, [ref] $JoinPointer)

        if ($result -or $JoinPointer -eq [IntPtr]::Zero) {
            # not Entra joined or API error
            return $false
        }

        $JoinInfo = [Runtime.InteropServices.Marshal]::PtrToStructure(
            $JoinPointer,
            [type][Windows.Identity.Entra+JoinInfo]
        )
        Write-Verbose -Message ("Join Status: {0}`n  Tenant ID: {1}`n  Tenant Name: {2}" -f
            $JoinInfo.JoinStatus,
            $JoinInfo.TenantId,
            $JoinInfo.TenantDisplayName
        )

        [bool] $JoinInfo.JoinStatus
    } catch {
        throw
    } finally {
        [Windows.Identity.Entra]::NetFreeAadJoinInformation($JoinPointer)
    }
}
