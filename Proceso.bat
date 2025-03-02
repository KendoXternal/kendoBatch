@echo off
TITLE Kendito Optz - Optimización Mínima de Procesos
COLOR 0A

echo ======================================================
echo              KENDITO OPTZ - MINIMIZAR PROCESOS
echo ======================================================
echo.
echo Desactivando servicios innecesarios...

REM Desactivar servicios comunes innecesarios
sc config WSearch start= disabled
sc config SysMain start= disabled
sc config DiagTrack start= disabled
sc config DoSvc start= disabled
sc config UsoSvc start= disabled
sc config Wuauserv start= disabled
sc config Fax start= disabled
sc config Spooler start= disabled
sc config XblAuthManager start= disabled
sc config XblGameSave start= disabled
sc config XboxGipSvc start= disabled
sc config XboxNetApiSvc start= disabled
sc config RetailDemo start= disabled
sc config CDPUserSvc start= disabled
sc config CDPSvc start= disabled
sc config BITS start= disabled
sc config MapsBroker start= disabled
sc config PrintNotify start= disabled
sc config PhoneSvc start= disabled
sc config BluetoothUserService start= disabled
sc config btagsvc start= disabled
sc config bthserv start= disabled

REM Detener los servicios ahora
net stop WSearch
net stop SysMain
net stop DiagTrack
net stop DoSvc
net stop UsoSvc
net stop Wuauserv
net stop Fax
net stop Spooler
net stop XblAuthManager
net stop XblGameSave
net stop XboxGipSvc
net stop XboxNetApiSvc
net stop RetailDemo
net stop CDPUserSvc
net stop CDPSvc
net stop BITS
net stop MapsBroker
net stop PrintNotify
net stop PhoneSvc
net stop BluetoothUserService
net stop btagsvc
net stop bthserv

REM Desactivar aplicaciones en segundo plano
echo Desactivando aplicaciones en segundo plano...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f

REM Ajustar para obtener el mejor rendimiento
echo Ajustando opciones de rendimiento...
systempropertiesperformance.exe

echo.
echo Todo listo. Reinicia tu PC para aplicar completamente los cambios.
pause
exit
