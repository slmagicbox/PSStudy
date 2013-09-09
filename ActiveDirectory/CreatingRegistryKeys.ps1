Push-Location
Set-Location HKCU:
Test-Path .\Software\test
New-Item -Path .\Software -Name test
Test-Path .\Software\test
remove-item .\Software\test
Test-Path .\Software\test
Pop-Location
