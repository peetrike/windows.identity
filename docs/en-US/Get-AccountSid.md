---
external help file: windows.identity-help.xml
Module Name: windows.identity
online version:
schema: 2.0.0
---

# Get-AccountSid

## SYNOPSIS

Retrives Security ID of given security principal

## SYNTAX

```
Get-AccountSid [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION

This function translates account names to Security ID-s.

## EXAMPLES

### Example 1

```powershell
Get-AccountSid -Name user.name
```

Provides Security ID (Sid) for given name

### Example 2

```powershell
Get-CurrentUser | Get-AccountSid
```

Provides Security ID (Sid) for currently logged on user.

## PARAMETERS

### -Name

Specifies name to translate.  The default is currently logged on user name.

```yaml
Type: String
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

### System.String

Account name to translate

## OUTPUTS

### System.Security.Principal.SecurityIdentifier

Security ID of given name

## NOTES

To translate computer name to SID, you should use computers SamAccountName
(the name with $ in the end).

## RELATED LINKS

[Get-CurrentUser](Get-CurrentUser.md)

[Get-SidIdentity](Get-SidIdentity.md)
