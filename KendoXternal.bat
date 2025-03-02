@echo off
COLOR 07
TITLE KENDOXTERNAL

:menu
cls
echo ====================================
echo          Bienvenido a KENDOXTERNAL
echo ====================================
echo.
echo [1] Desactivacion de Servicios
echo [2] Habilitar Maximo Rendimiento
echo [3] Optimizar Nucleos y RAM
echo [4] Eliminar Bloatware y Telemetría
echo [5] Mejora de FPS y Efectos
echo [6] Desactivar Funciones Innecesarias
echo [7] Limpieza Profunda del Sistema
echo [8] Aplicar Tweaks de Red y CPU
echo [9] Optimizacion Avanzada y Exclusiva
echo [10] Salir
echo.
set /p opcion=Elige una opcion: 

if "%opcion%" == "1" goto desactivar_servicios
if "%opcion%" == "2" goto max_rendimiento
if "%opcion%" == "3" goto optimizar_nucleos
if "%opcion%" == "4" goto eliminar_bloatware
if "%opcion%" == "5" goto mejora_fps
if "%opcion%" == "6" goto desactivar_funciones
if "%opcion%" == "7" goto limpieza_profunda
if "%opcion%" == "8" goto tweaks_red_cpu
if "%opcion%" == "9" goto optimizacion_avanzada
if "%opcion%" == "10" exit

:desactivar_servicios
cls
echo Desactivando servicios innecesarios...
sc config DiagTrack start= disabled
sc stop DiagTrack
sc config dmwappushservice start= disabled
sc stop dmwappushservice
sc config WSearch start= disabled
sc stop WSearch
sc config Fax start= disabled
sc stop Fax
sc config BluetoothUserService start= disabled
sc stop BluetoothUserService
sc config OneSyncSvc start= disabled
sc stop OneSyncSvc
echo Servicios desactivados correctamente.
pause
goto menu

:max_rendimiento
cls
echo Habilitando el máximo rendimiento...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg -setactive SCHEME_MAX
powercfg -change -monitor-timeout-ac 0
powercfg -change -disk-timeout-ac 0
powercfg -change -standby-timeout-ac 0
powercfg -change -hibernate-timeout-ac 0
bcdedit /set useplatformtick yes
bcdedit /set disabledynamictick yes
bcdedit /set useplatformclock true
echo Modo de máximo rendimiento habilitado.
pause
goto menu

:optimizar_nucleos
cls
echo Optimizando núcleos y memoria RAM...
bcdedit /set numproc 6
bcdedit /set increaseuserva 4096
bcdedit /deletevalue useplatformclock
echo Optimización de núcleos y RAM completada.
pause
goto menu

:eliminar_bloatware
cls
echo Eliminando bloatware y telemetría...
Get-AppxPackage *cortana* | Remove-AppxPackage
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
sc config DiagTrack start= disabled
sc stop DiagTrack
echo Bloatware eliminado correctamente.
pause
goto menu

:mejora_fps
cls
echo Aplicando mejoras de FPS...
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v EnableFastTaskbar /t REG_DWORD /d 1 /f
reg add "HKCU\Control Panel\Desktop" /v ForegroundLockTimeout /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d 1000 /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v EnableAeroPeek /t REG_DWORD /d 0 /f
echo Mejora de FPS aplicada.
pause
goto menu

:desactivar_funciones
cls
echo Desactivando funciones innecesarias...
powercfg -h off
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoNewAppAlert /t REG_DWORD /d 1 /f
echo Funciones innecesarias desactivadas.
pause
goto menu

:limpieza_profunda
cls
echo Realizando limpieza profunda del sistema...
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
del /s /f /q C:\WINDOWS\Prefetch
rd /s /q C:\WINDOWS\temp
md C:\WINDOWS\temp
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
echo Limpieza completa.
pause
goto menu

:tweaks_red_cpu
cls
echo Aplicando tweaks de red y CPU...
netsh interface tcp set global autotuning=disabled
netsh interface tcp set heuristics disabled
netsh interface tcp set global rss=enabled
netsh int tcp set global chimney=enabled
echo Tweaks aplicados correctamente.
pause
goto menu

:optimizacion_avanzada
cls
echo Aplicando optimización avanzada...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisableLastAccessUpdate /t REG_DWORD /d 1 /f
reg add "HKCU\Control Panel\Desktop" /v WaitToKillAppTimeout /t REG_SZ /d 2000 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v SMB1 /t REG_DWORD /d 0 /f
echo Optimización avanzada completada.
pause
goto menu

:do_clear
wevtutil.exe cl %1
goto :eof
