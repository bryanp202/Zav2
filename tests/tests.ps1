Write-Host "Building Zav..."
& ".\build.bat"

Write-Host
Write-Host "------------------------"
Write-Host

& ".\tests\lexer\lexer.ps1"

Write-Host
Write-Host "------------------------"
Write-Host
