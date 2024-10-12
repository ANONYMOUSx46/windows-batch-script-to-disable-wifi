@echo off
:: Enable Wifi
netsh interface set interface "Wi-Fi" admin=enabled 2>> error.log
if %errorlevel% neq 0 (
    echo Failed to enable Ethernet. Error: %errorlevel%
    exit /b %errorlevel%
)
echo Wifi has been enabled.

:: Remove scheduled task to disable Wifi on startup
schtasks /delete /tn "DisableWifiOnStartup" /f
if %errorlevel% neq 0 (
    echo Failed to delete scheduled task. Error: %errorlevel%
    exit /b %errorlevel%
)
echo Scheduled task to disable Wifi on startup has been removed.

pause
