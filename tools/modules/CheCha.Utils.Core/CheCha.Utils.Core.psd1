@{
    RootModule        = 'CheCha.Utils.Core.psm1'
    ModuleVersion     = '1.0.2'
    GUID              = 'de23a6c2-8b1d-4b52-9d6a-9b3b3a5b1f11'
    Author            = 'С.Ч.'
    CompanyName       = 'CHECHA CORE / DAO-GOGS'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Write-CheChaLog','Initialize-Directory','Resolve-PathSafe','Import-ScriptOnce')
    AliasesToExport   = @('Write-Init','Ensure-Dir','Dot-SourceOnce')
    CmdletsToExport   = @()
    VariablesToExport = @()
    PrivateData       = @{}
}
