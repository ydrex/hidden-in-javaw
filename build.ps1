# build both demos
$ErrorActionPreference = "Stop"
$root = $PSScriptRoot
$out = Join-Path $root "examples\runs-as-exe\bin\Release\net8.0"

Write-Host "exe..."
Push-Location (Join-Path $root "examples\runs-as-exe")
dotnet build RunsAsExe.csproj -c Release
foreach ($f in @("RunsAsExe.exe", "RunsAsExe.dll", "RunsAsExe.deps.json", "RunsAsExe.runtimeconfig.json")) {
    Copy-Item (Join-Path $out $f) $f -Force
}
Pop-Location

Write-Host "jar..."
Push-Location (Join-Path $root "examples\runs-as-java")
if (Test-Path "RunsAsJava.jar") { Remove-Item "RunsAsJava.jar" -Force }
javac RunsAsJava.java
jar cfe RunsAsJava.jar RunsAsJava RunsAsJava.class
Remove-Item RunsAsJava.class -ErrorAction SilentlyContinue
Pop-Location

Write-Host "ok"
