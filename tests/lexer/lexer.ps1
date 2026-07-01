$srcFiles = ".\tests\lexer\test1.zav", ".\src\lexer.zav"
$zavPath = ".\out\zav.exe"
$zavArgs = $() # "--lexer")

$runningProcesses = @()
Write-Host "Starting lexer tests..."
foreach ($src in $srcFiles) {
    $arguments = $src
    $arguments += $zavArgs
    $runningProcesses += Start-Process -FilePath $zavPath `
        -ArgumentList $arguments `
        -PassThru `
        -WindowStyle Hidden
}

for ($i = 0; $i -lt $runningProcesses.Count; $i++) {
    $runningProcesses[$i] | Wait-Process
    Write-Host $srcFiles[$i] " -> " $runningProcesses[$i].ExitCode
}