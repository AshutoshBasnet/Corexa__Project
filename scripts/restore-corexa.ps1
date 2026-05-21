param(
    [Parameter(Mandatory = $true)]
    [string]$BackupFile,
    [string]$User = "root",
    [string]$Password = ""
)

$ErrorActionPreference = "Stop"

if (!(Test-Path -LiteralPath $BackupFile)) {
    throw "Backup file not found: $BackupFile"
}

if ([string]::IsNullOrEmpty($Password)) {
    Get-Content -LiteralPath $BackupFile | mysql --user=$User
} else {
    Get-Content -LiteralPath $BackupFile | mysql --user=$User --password=$Password
}

Write-Host "Database restored from: $BackupFile"
