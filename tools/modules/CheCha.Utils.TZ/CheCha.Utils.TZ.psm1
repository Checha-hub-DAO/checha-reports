# CheCha.Utils.TZ.psm1  (v1.0.0)
Set-StrictMode -Version Latest

function Get-LocalIsoNow {
    (Get-Date).ToString('yyyy-MM-dd HH:mm:ss')
}
function Get-UtcIsoNow {
    (Get-Date).ToUniversalTime().ToString('yyyy-MM-dd HH:mm:ss')
}
function Convert-TimeZone {
    param(
        [Parameter(Mandatory)][datetime]$DateTime,
        [Parameter(Mandatory)][string]$TimeZoneId  # приклад: 'Europe/Kyiv' або 'E. Europe Standard Time'
    )
    try {
        $tz = [System.TimeZoneInfo]::FindSystemTimeZoneById($TimeZoneId)
    } catch {
        throw "Time zone '$TimeZoneId' not found. On older Windows, try Windows ID like 'E. Europe Standard Time'."
    }
    [System.TimeZoneInfo]::ConvertTime($DateTime, $tz)
}

Export-ModuleMember -Function Get-LocalIsoNow, Get-UtcIsoNow, Convert-TimeZone
