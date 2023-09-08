---
external help file: windows.identity-help.xml
Module Name: windows.identity
online version:
schema: 2.0.0
---

# Get-SidIdentity

## SYNOPSIS

Converts provided Security ID (Sid) to account name

## SYNTAX

```
Get-SidIdentity [[-Sid] <SecurityIdentifier>] [<CommonParameters>]
```

## DESCRIPTION

This function converts provided Security ID (Sid) to account name

## EXAMPLES

### Example 1

```powershell
Get-SidIdentity -Sid S-1-5-32-545
```

This example converts local Users group Sid to account name

### Example 2

```powershell
Get-CimInstance -ClassName win32_UserProfile | Select-Object -First 1 | Get-SidIdentity
```

This example converts Sid of first user profile to account name

## PARAMETERS

### -Sid

Specifies Security Id to convert.  The default value is currently logged on user
Sid.

```yaml
Type: SecurityIdentifier
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Security.Principal.SecurityIdentifier

## OUTPUTS

### System.String

Converted account name

## NOTES

## RELATED LINKS

[Get-AccountSid](Get-AccountSid.md)

[Get-CurrentUser](Get-CurrentUser.md)
