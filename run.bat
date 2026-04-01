@echo off
setlocal
cd /d "%~dp0"

echo 🧹 Cleaning legacy files...
del confetti.py requirements.txt confetti_config.json confetti_config.ini confetti.html index.html settings.html main.js package.json preload.js package-lock.json confetti.ps1 profiles.db 2>nul
rd /s /q node_modules 2>nul

echo 🛠 Compiling Ultra-Fast Native Confetti Engine...

set FW_DIR="C:\Windows\Microsoft.NET\Framework64\v4.0.30319"
if not exist %FW_DIR% set FW_DIR="C:\Windows\Microsoft.NET\Framework\v4.0.30319"

set CSC=%FW_DIR%\csc.exe

if not exist %CSC% (
    echo [X] .NET Framework 4.0 not found!
    pause & exit /b
)

:: Back to WinForms for Maximum Performance & Minimum RAM
%CSC% /t:winexe /out:Confetti.exe /win32icon:confetti.ico /optimize+ /r:System.dll,System.Windows.Forms.dll,System.Drawing.dll,System.Core.dll Confetti.cs

if %ERRORLEVEL% NEQ 0 (
    echo [X] Compilation failed. See errors above.
    pause & exit /b
)

echo [✓] Success! Lauching Ultra-Fast Confetti...
echo [!] Ctrl+Shift+C  = Fire (Zero Lag)
echo [!] Ctrl+Shift+S  = Open Config Folder
echo.
start "" "Confetti.exe"
exit
