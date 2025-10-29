Set-StrictMode -Version Latest

# --- Minimal IANA -> Windows map (доповниш за потреби)
$script:IanaToWindows = @{
    # Europe
    "Europe/Kyiv"      = "FLE Standard Time"
    "Europe/Kiev"      = "FLE Standard Time"   # старий запис
    "Europe/Warsaw"    = "Central European Standard Time"
    "Europe/Berlin"    = "W. Europe Standard Time"
    "Europe/London"    = "GMT Standard Time"
    # America
    "America/New_York" = "Eastern Standard Time"
    "America/Chicago"  = "Central Standard Time"
    "America/Denver"   = "Mountain Standard Time"
    "America/Los_Angeles" = "Pacific Standard Time"
    # Asia
    "Asia/Tokyo"       = "Tokyo Standard Time"
    "Asia/Shanghai"    = "China Standard Time"
    "Asia/Seoul"       = "Korea Standard Time"
    # UTC
    "Etc/UTC"          = "UTC"
    "UTC"              = "UTC"
}

function Resolve-TimeZone {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string]$Id
    )
    # Якщо це вже Windows ID — повернемо як є (пробуємо знайти)
    try {
        return [System.TimeZoneInfo]::FindSystemTimeZoneById($Id)
    } catch {
        # Спробуємо як IANA через мапу
        if ($script:IanaToWindows.ContainsKey($Id)) {
            $win = $script:IanaToWindows[$Id]
            return [System.TimeZoneInfo]::FindSystemTimeZoneById($win)
        }
        throw "Unknown timezone id: '$Id'. Add to IANA->Windows map."
    }
}

function Get-NowUtc {
    [CmdletBinding()] param()
    return (Get-Date).ToUniversalTime()
}

function Get-LocalTime {
    [CmdletBinding()]
    param(
        [string]$TimeZoneId = [System.TimeZoneInfo]::Local.Id
    )
    $utc = (Get-Date).ToUniversalTime()
    $tz  = Resolve-TimeZone -Id $TimeZoneId
    return [System.TimeZoneInfo]::ConvertTimeFromUtc($utc, $tz)
}

function Convert-TimeZone {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][datetime]$DateTime,
        [Parameter(Mandatory)][string]$From,
        [Parameter(Mandatory)][string]$To
    )

    $tzFrom = Resolve-TimeZone -Id $From
    $tzTo   = Resolve-TimeZone -Id $To

    # Нормалізуємо Kind, щоб не ламався ConvertTimeToUtc при Kind=Local/UTC
    $dt = if ($DateTime.Kind -ne [System.DateTimeKind]::Unspecified) {
        [System.DateTime]::SpecifyKind($DateTime, [System.DateTimeKind]::Unspecified)
    } else { $DateTime }

    $utc = [System.TimeZoneInfo]::ConvertTimeToUtc($dt, $tzFrom)
    return [System.TimeZoneInfo]::ConvertTimeFromUtc($utc, $tzTo)
}

Export-ModuleMember -Function Resolve-TimeZone, Get-NowUtc, Get-LocalTime, Convert-TimeZone
