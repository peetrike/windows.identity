---
external help file: windows.identity-help.xml
Module Name: windows.identity
online version:
schema: 2.0.0
---

# Get-DomainSid

## SYNOPSIS

Returns specified domain Security Id (Sid)

## SYNTAX

### Custom (Default)
```
Get-DomainSid [-Domain <String>] [-Credential <PSCredential>] [<CommonParameters>]
```

### Computer
```
Get-DomainSid [-Computer] [<CommonParameters>]
```

## DESCRIPTION

This function returns Security ID (Sid) for provided domain.

## EXAMPLES

### Example 1

```powershell
Get-DomainSid -Computer
```

Retrieves domain SID for domain where current computer belongs to

### Example 2

```powershell
Get-DomainSid -Domain remote.domain -Credential remote.user
```

Retrieves domain SID for specified domain using provided credential

## PARAMETERS

### -Computer

Specifies that computer's domain should be connected

```yaml
Type: SwitchParameter
Parameter Sets: Computer
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential

Specifes credential to use for connecting to custom domain

```yaml
Type: PSCredential
Parameter Sets: Custom
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Domain

Specify custom domain name

```yaml
Type: String
Parameter Sets: Custom
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

### System.Security.Principal.SecurityIdentifier

Domain Sid

## NOTES

## RELATED LINKS

[Get-CurrentUser](Get-CurrentUser.md)

[Get-AccountSid](Get-AccountSid.md)
