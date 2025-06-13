---
external help file: windows.identity-help.xml
Module Name: windows.identity
online version:
schema: 2.0.0
---

# Test-IsAdmin

## SYNOPSIS

Tells whether the current user is an administrator.

## SYNTAX

```
Test-IsAdmin [<CommonParameters>]
```

## DESCRIPTION

This function determines whether the current user is a member of the
Administrators group on the local computer.
It returns TRUE if a user is an administrator and FALSE otherwise.
This function has no parameters.

## EXAMPLES

### EXAMPLE 1

```powershell
Test-IsAdmin
```

```output
False
```

This command tests if administrative privileges are available.

### EXAMPLE 2

```powershell
function prompt {
    @(
        if (Test-IsAdmin) { '\[ADMIN\]:' }
        if (Test-Path variable:/PSDebugContext) { '[DBG]:' }
        'PS'
        Get-Location
        '>' * ($NestedPromptLevel + 1)
        ''
    ) -join ' '
}
```

This prompt uses the Test-IsAdmin function to change the prompt when the user is an administrator.

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Boolean

TRUE if a user is an administrator and FALSE otherwise.

## NOTES

## RELATED LINKS

[WindowsPrincipal class](https://learn.microsoft.com/dotnet/api/system.security.principal.windowsprincipal)
