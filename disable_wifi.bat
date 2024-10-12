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
