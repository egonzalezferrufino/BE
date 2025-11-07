@echo off
cd /d "C:\mailhog"
REM Inicia MailHog en segundo plano, guarda salida en un log
start "" /B "C:\mailhog\MailHog_windows_386.exe" > "C:\mailhog\mailhog.log" 2>&1
exit
