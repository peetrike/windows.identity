# windows.identity

## about_windows.identity

# SHORT DESCRIPTION

PowerShell module for windows identities

# LONG DESCRIPTION

This module contains functions to get Security IDs of different identities or to
convert Security IDs back to account names

# EXAMPLES

```powershell
Get-CurrentUser
```

This example returns identity of currently logged on user

```powershell
Get-CimInstance -ClassName Win32_UserProfile |
    Select-Object -First 1 |
    Get-SidIdentity
```

This example converts first user profile owner Sid to account name

# NOTE

PowerShell 2.0 does not return claims with current user identity.
So `Get-CurrentUser -Claims` returns nothing when run in PowerShell 2.0.

# SEE ALSO

WindowsIdentity type documentation:
https://learn.microsoft.com/dotnet/api/System.Security.Principal.WindowsIdentity

# KEYWORDS

- Security ID
- Sid
- Account
