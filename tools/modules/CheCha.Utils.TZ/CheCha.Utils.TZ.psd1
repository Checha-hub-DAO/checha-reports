@{
    RootModule        = 'CheCha.Utils.TZ.psm1'
    ModuleVersion     = '1.0.0'
    GUID              = '8d2e6b2a-9d7c-4a4b-b9d2-9e5a3ed0d2e4'
    Author            = 'С.Ч.'
    CompanyName       = 'CHECHA CORE / DAO-GOGS'
    PowerShellVersion = '7.2'
    FunctionsToExport = @('Get-LocalIsoNow','Get-UtcIsoNow','Convert-TimeZone')
    AliasesToExport   = @()
    CmdletsToExport   = @()
    PrivateData       = @{ PSData = @{ Tags = @('CheCha','Utils','TZ') } }
}
