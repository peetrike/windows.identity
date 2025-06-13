@{
    ModuleToProcess   = 'windows.identity.psm1'
    ModuleVersion     = '0.2.0'

    GUID              = '57f17d22-6d4f-4d77-9869-dc7a1072bcce'

    Author            = 'Peter Wawa'
    Copyright         = 'Copyright (c) 2025 Peter Wawa'

    Description       = 'PowerShell module for windows identities'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '2.0'

    <# CompatiblePSEditions = @(
        'Core'
        'Desktop'
    ) #>

    # Modules that must be imported into the global environment prior to importing this module
    # RequiredModules = @()

    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @('bin\windows.identity.dll')

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # Expensive for import time, no more than one should be used.
    TypesToProcess    = @('windows.identity.Types.ps1xml')

    # Format files (.ps1xml) to be loaded when importing this module.
    # Expensive for import time, no more than one should be used.
    FormatsToProcess  = @('windows.identity.Format.ps1xml')

    # Functions to export from this module
    FunctionsToExport = @()

    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all files packaged with this module
    # FileList          = @()

    PrivateData       = @{
        PSData = @{
            Tags         = @(
                'identity'
                'Windows'
                'PSEdition_Core'
                'PSEdition_Desktop'
            )

            LicenseUri   = 'https://github.com/peetrike/windows.identity/blob/main/LICENSE'
            ProjectUri   = 'https://github.com/peetrike/windows.identity'
            ReleaseNotes = 'https://github.com/peetrike/windows.identity/blob/main/CHANGELOG.md'

            # A URL to an icon representing this module.
            # IconUri = ''

            # Prerelease string of this module
            # Prerelease = ''

            # Flag to indicate whether the module requires explicit user acceptance for install/update/save
            # RequireLicenseAcceptance = $false

            # External dependent modules of this module
            # ExternalModuleDependencies = @()
        }
    }
}
