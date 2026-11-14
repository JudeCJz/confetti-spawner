@echo off
setlocal
cd /d "%~dp0"

set CSC=C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe
if not exist "%CSC%" set CSC=C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe
if not exist "%CSC%" (
    echo [X] .NET Framework 4 compiler not found.
    pause & exit /b 1
)

taskkill /im Confetti.exe /f >nul 2>&1

echo Building Confetti.exe ...
"%CSC%" -nologo /t:winexe /out:Confetti.exe /win32icon:confetti.ico /optimize+ /r:System.dll,System.Windows.Forms.dll,System.Drawing.dll,System.Core.dll Confetti.cs
if errorlevel 1 (
    echo [X] Build failed. See errors above.
    pause & exit /b 1
)

echo Build OK. Starting Confetti. Ctrl+Shift+C fires, hold to keep firing.
start "" "Confetti.exe"
exit /b 0
