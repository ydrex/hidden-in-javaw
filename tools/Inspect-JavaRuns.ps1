# lists java.exe / javaw.exe and any -jar path

$rows = Get-CimInstance Win32_Process -Filter "Name='java.exe' OR Name='javaw.exe'" -ErrorAction SilentlyContinue |
    Select-Object ProcessId, Name, CommandLine

if (-not $rows) {
    Write-Host "no java running"
    exit 0
}

foreach ($p in $rows) {
    Write-Host ("{0}  pid {1}" -f $p.Name, $p.ProcessId)
    Write-Host ("  {0}" -f $p.CommandLine)
    Write-Host ""
}
