//created by ANONYMOUSx46


@echo off

:: just incase uk

ipconfig /release 

:: Disable Ethernet
netsh interface set interface "Wi-Fi" admin=disabled 2>> error.log
if %errorlevel% neq 0 (
    echo Failed to disable Wifi. Error: %errorlevel%
    exit /b %errorlevel%
)
echo Wi-Fi has been disabled.

:: Create scheduled task to disable Wifi on startup
schtasks /create /tn "DisableWifiOnStartup" /tr "E:\WifiScripts\disable_wifi.bat" /sc onstart /ru SYSTEM /f
if %errorlevel% neq 0 (
    echo Failed to create scheduled task. Error: %errorlevel%
    exit /b %errorlevel%
)
echo Scheduled task created to disable Wifi on startup.

:: Temporarily disable firewall to ensure script runs correctly
netsh advfirewall set allprofiles state off
if %errorlevel% neq 0 (
    echo Failed to disable firewall. Error: %errorlevel%
    exit /b %errorlevel%
)
echo Firewall has been disabled temporarily.

:: Re-enable firewall (optional but recommended)
timeout /t 5 /nobreak >nul
netsh advfirewall set allprofiles state on
if %errorlevel% neq 0 (
    echo Failed to re-enable firewall. Error: %errorlevel%
    exit /b %errorlevel%
)
echo Firewall has been re-enabled.

pause
