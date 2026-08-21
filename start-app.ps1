# PowerShell script to start Corexa Application
$ErrorActionPreference = "Stop"

$workspace = Split-Path -Parent $MyInvocation.MyCommand.Path
$jdkPath = "C:\Program Files\Eclipse Adoptium\jdk-17.0.20.8-hotspot"
$mavenPath = "$workspace\.tools\apache-maven-3.9.6\bin"
$tomcatPath = "$workspace\.tools\apache-tomcat-10.1.20"
$mariadbBin = "C:\Program Files\MariaDB 12.3\bin"

$env:JAVA_HOME = $jdkPath
$env:CATALINA_HOME = $tomcatPath
$env:Path = "$jdkPath\bin;$mavenPath;$mariadbBin;$env:Path"

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "       Starting Corexa Application        " -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

# 1. Start MariaDB if not running
$dbTest = Test-NetConnection -ComputerName 127.0.0.1 -Port 3306 -WarningAction SilentlyContinue
if (-not $dbTest.TcpTestSucceeded) {
    Write-Host "[1/3] Starting Database Server..." -ForegroundColor Yellow
    Start-Process -FilePath "$mariadbBin\mariadbd.exe" -ArgumentList "--console" -WindowStyle Hidden
    Start-Sleep -Seconds 3
} else {
    Write-Host "[1/3] Database is already running on port 3306." -ForegroundColor Green
}

# 2. Build WAR
Write-Host "[2/3] Building application..." -ForegroundColor Yellow
Set-Location $workspace
& "$mavenPath\mvn.cmd" clean package -DskipTests

# 3. Deploy to Tomcat
Write-Host "[3/3] Deploying to Tomcat..." -ForegroundColor Yellow
$webapps = "$tomcatPath\webapps"
Copy-Item "$workspace\target\Corexa_Project-0.0.1-SNAPSHOT.war" -Destination "$webapps\ROOT.war" -Force
Copy-Item "$workspace\target\Corexa_Project-0.0.1-SNAPSHOT.war" -Destination "$webapps\Corexa_Project.war" -Force

Write-Host "`n>>> Corexa is running at: http://localhost:8080" -ForegroundColor Green
Write-Host "Starting Tomcat console output... (Press Ctrl+C to stop)`n" -ForegroundColor Cyan
& "$tomcatPath\bin\catalina.bat" run
