---
external help file: windows.identity-help.xml
Module Name: windows.identity
online version:
schema: 2.0.0
---

# Get-ComputerSid

## SYNOPSIS

Retrieves Computer Security ID (Sid)

## SYNTAX

```
Get-ComputerSid [<CommonParameters>]
```

## DESCRIPTION

This function retrieves local computer Security ID (Sid)

## EXAMPLES

### Example 1

```powershell
Get-ComputerSid
```

This example retrieves local computer Sid

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Security.Principal.SecurityIdentifier

Local computer SID

## NOTES

## RELATED LINKS

[Get-AccountSid](Get-AccountSid.md)
