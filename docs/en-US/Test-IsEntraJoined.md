---
external help file: windows.identity-help.xml
Module Name: windows.identity
online version:
schema: 2.0.0
---

# Test-IsEntraJoined

## SYNOPSIS

Test computer Microsoft Entra Join status

## SYNTAX

```
Test-IsEntraJoined [[-TenantId] <String>] [<CommonParameters>]
```

## DESCRIPTION

This function determines the local computer Microsoft Entra join status

## EXAMPLES

### Example 1

```powershell
Test-IsEntraJoined -TenantId 78486959-e47f-4071-bd20-8c61932ef138
```

This example checks if computer is joined to specified Microsoft Entra ID tenant

## PARAMETERS

### -TenantId

Specifies Entra tenant to check against.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Boolean

## NOTES

Based on script from https://github.com/DeployWindowsCom/DeployWindows-Scripts/blob/master/Azure%20AD/Get-AadJoinInformation.ps1

## RELATED LINKS

[Test-IsADJoined](Test-IsADJoined.md)

[NetGetAadJoinInformation function](https://learn.microsoft.com/windows/win32/api/lmjoin/nf-lmjoin-netgetaadjoininformation)
