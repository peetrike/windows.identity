---
external help file: windows.identity-help.xml
Module Name: windows.identity
online version:
schema: 2.0.0
---

# Get-CurrentUser

## SYNOPSIS

Provides currently logged on user credential

## SYNTAX

### All (Default)
```
Get-CurrentUser [<CommonParameters>]
```

### Groups
```
Get-CurrentUser [-Groups] [<CommonParameters>]
```

### User
```
Get-CurrentUser [-User] [<CommonParameters>]
```

### Claims
```
Get-CurrentUser [-Claims] [<CommonParameters>]
```

### Privileges
```
Get-CurrentUser [-Privileges] [<CommonParameters>]
```

## DESCRIPTION

This function retrieves currently logged on user credential information.

## EXAMPLES

### Example 1

```powershell
Get-CurrentUser -Claims
```

This example retrieves currently logged on user claims

### Example 2

```powershell
Get-CurrentUser
```

This example retrieves currently logged on user identity

## PARAMETERS

### -Claims

Return only claims.
Claims are not returned, when this function is used in PowerShell 2.0

```yaml
Type: SwitchParameter
Parameter Sets: Claims
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Groups

Return only Group identities

```yaml
Type: SwitchParameter
Parameter Sets: Groups
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Privileges

Return only currently logged on user privileges

```yaml
Type: SwitchParameter
Parameter Sets: Privileges
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -User

Return only user name and Sid

```yaml
Type: SwitchParameter
Parameter Sets: User
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Security.Principal.WindowsIdentity

Returned logged on user identity

### System.Security.Claims.Claim

User claims

### PSObject

User Groups or privileges

## NOTES

## RELATED LINKS

[Get-AccountSid](Get-AccountSid.md)

[Get-AccountName](Get-AccountName.md)
