---
external help file: telia.windows.management-help.xml
Module Name: telia.windows.management
online version:
schema: 2.0.0
---

# Test-IsADMember

## SYNOPSIS

Tests if the computer belongs to domain

## SYNTAX

```
Test-IsADMember [<CommonParameters>]
```

## DESCRIPTION

This function determines the local computer domain membership

## EXAMPLES

### Example 1

```powershell
Test-IsADMember
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

[Win32_ComputerSystem class](https://learn.microsoft.com/windows/win32/cimwin32prov/win32-computersystem)
