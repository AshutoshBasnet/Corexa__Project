param(
    [string]$Database = "corexa",
    [string]$User = "root",
    [string]$Password = "",
    [string]$OutputDirectory = "backups"
)

$ErrorActionPreference = "Stop"

if (!(Test-Path -LiteralPath $OutputDirectory)) {
    New-Item -ItemType Directory -Path $OutputDirectory | Out-Null
}

$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$backupFile = Join-Path $OutputDirectory "$Database-$timestamp.sql"

if ([string]::IsNullOrEmpty($Password)) {
    mysqldump --user=$User --single-transaction --routines --triggers --databases $Database | Out-File -FilePath $backupFile -Encoding utf8
} else {
    mysqldump --user=$User --password=$Password --single-transaction --routines --triggers --databases $Database | Out-File -FilePath $backupFile -Encoding utf8
}

Write-Host "Database backup created: $backupFile"
