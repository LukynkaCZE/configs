get-process | where {$_.ProcessName -like "*TChat*"} | Stop-Process -Force
