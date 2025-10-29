Set-StrictMode -Version Latest

# ===== Public API (Approved verbs) =====
function Write-CheChaLog {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string]$Message,
        [ValidateSet('INFO','OK','WARN','ERR')][string]$Level = 'INFO'
    )
    $ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    Write-Host "[$Level] $ts $Message"
}

function Initialize-Directory {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Path)
    if (-not [string]::IsNullOrWhiteSpace($Path) -and -not (Test-Path -LiteralPath $Path)) {
        New-Item -ItemType Directory -Force -Path $Path | Out-Null
    }
}

function Resolve-PathSafe {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Path)
    try { (Resolve-Path -Path $Path -ErrorAction Stop).ProviderPath } catch { $null }
}

# ---- one-time dot-source registry for external scripts (fallback helper)
if (-not (Get-Variable -Name CHECHA_DotSourced -Scope Global -ErrorAction SilentlyContinue)) {
    $global:CHECHA_DotSourced = @{}
}
function Import-ScriptOnce {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Path)
    $rp = Resolve-PathSafe $Path
    if (-not $rp) { return $false }
    $key = $rp.ToLowerInvariant()
    if ($global:CHECHA_DotSourced.ContainsKey($key)) { return $true }
    . $rp
    $global:CHECHA_DotSourced[$key] = $true
    return $true
}

# ===== Back-compat aliases (старі імена) =====
Set-Alias -Name Write-Init     -Value Write-CheChaLog
Set-Alias -Name Ensure-Dir     -Value Initialize-Directory
Set-Alias -Name Dot-SourceOnce -Value Import-ScriptOnce

Export-ModuleMember -Function Write-CheChaLog,Initialize-Directory,Resolve-PathSafe,Import-ScriptOnce `
                    -Alias    Write-Init,Ensure-Dir,Dot-SourceOnce
