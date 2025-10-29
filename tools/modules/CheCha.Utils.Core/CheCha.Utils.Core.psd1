@{
    RootModule        = 'CheCha.Utils.Core.psm1'
    ModuleVersion     = '1.0.1'
    GUID              = '4f6692e6-7c0e-414e-9b66-40226b2c4d60'
    Author            = 'С.Ч.'
    CompanyName       = 'CHECHA CORE / DAO-GOGS'
    PowerShellVersion = '7.2'
    FunctionsToExport = @('Write-CheChaLog','Initialize-Directory','Resolve-PathSafe','Import-ScriptOnce')
    AliasesToExport   = @('Write-Init','Ensure-Dir','Dot-SourceOnce')
    CmdletsToExport   = @()
    PrivateData       = @{ PSData = @{ Tags = @('CheCha','Utils','Core') } }
}

