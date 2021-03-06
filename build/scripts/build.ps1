mkdir .\documentation 2>&1 | Out-Null
mkdir .\documentation\html 2>&1 | Out-Null
mkdir .\documentation\links 2>&1 | Out-Null
mkdir .\build 2>&1 | Out-Null
mkdir .\build\assemblies 2>&1 | Out-Null
mkdir .\build\executables 2>&1 | Out-Null
mkdir .\build\interfaces 2>&1 | Out-Null
mkdir .\build\libraries 2>&1 | Out-Null
mkdir .\build\logs 2>&1 | Out-Null
mkdir .\build\maps 2>&1 | Out-Null
mkdir .\build\objects 2>&1 | Out-Null
mkdir .\build\scripts 2>&1 | Out-Null

$version = "1.1.1"

Write-Host "Building the CSPRNG Library (static)... " -NoNewLine
dmd `
.\source\macros.ddoc `
.\source\csprng\system.d `
-Dd".\\documentation\\html\\" `
-Hd".\\build\\interfaces" `
-op `
-of".\\build\\libraries\\csprng-$version.lib" `
-Xf".\\documentation\\csprng-$version.json" `
-lib `
-O `
-release `
-d
Write-Host "Done." -ForegroundColor Green

Write-Host "Building the CSPRNG Library (shared / dynamic)... " -NoNewLine
dmd `
.\source\csprng\system.d `
-of".\\build\\libraries\\csprng-$version.dll" `
-lib `
-shared `
-O `
-inline `
-release `
-d
Write-Host "Done." -ForegroundColor Green

Write-Host "Building the CSPRNG Command-Line Tool, get-cryptobytes... " -NoNewLine
dmd `
 .\source\tools\get_cryptobytes.d `
 -I".\\build\\interfaces\\source" `
 .\build\libraries\csprng-$version.lib `
 -of".\\build\\executables\\get-cryptobytes" `
 -inline `
 -release `
 -O `
 -d
Write-Host "Done." -ForegroundColor Green