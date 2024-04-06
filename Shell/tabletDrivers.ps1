get-process | where {$_.ProcessName -like "*tablet*"} | Stop-Process
Start-Process -FilePath "C:\Users\LukynkaCZE\Documents\OpenTabletDriver.win-x64\OpenTabletDriver.Daemon.exe"

