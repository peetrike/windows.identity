---
external help file: windows.identity-help.xml
Module Name: windows.identity
online version:
schema: 2.0.0
---

# Test-IsADJoined

## SYNOPSIS

Tests if the computer belongs to domain

## SYNTAX

```
Test-IsADJoined [<CommonParameters>]
```

## DESCRIPTION

This function determines the local computer domain membership

## EXAMPLES

### Example 1

```powershell
Test-IsADJoined
```

This example returns local computer domain membership

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Boolean

## NOTES

## RELATED LINKS

[Test-IsEntraJoined](Test-IsEntraJoined.md)

[NetGetJoinInformation function](https://learn.microsoft.com/en-us/windows/win32/api/lmjoin/nf-lmjoin-netgetjoininformation)
