---
external help file: windows.identity-help.xml
Module Name: windows.identity
online version:
schema: 2.0.0
---

# Get-AccountName

## SYNOPSIS

Converts provided Security ID (Sid) to account name

## SYNTAX

```
Get-AccountName [[-Sid] <SecurityIdentifier>] [<CommonParameters>]
```

## DESCRIPTION

This function converts provided Security ID (Sid) to account name

## EXAMPLES

### Example 1

```powershell
Get-AccountName -Sid S-1-5-32-545
```

This example converts local Users group Sid to account name

### Example 2

```powershell
$UserName = @{ Name = 'UserName'; Expression = { $_ | Get-AccountName } }
Get-CimInstance -ClassName Win32_UserProfile | Select-Object LocalPath, $UserName
```

This example returns user profile paths and usernames.

## PARAMETERS

### -Sid

Specifies Security ID to convert

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

The Security ID to convert

## OUTPUTS

### System.String

The converted account name

## NOTES

## RELATED LINKS

[Get-AccountSid](Get-AccountSid.md)

[Get-CurrentUser](Get-CurrentUser.md)
