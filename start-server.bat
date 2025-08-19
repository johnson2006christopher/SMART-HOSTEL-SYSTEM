
@echo off
echo ========================================
echo 🚀 Smart Hostel System Server Starter
echo ========================================
echo.

echo Checking if Node.js is installed...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed!
    echo.
    echo Please install Node.js first:
    echo 1. Go to: https://nodejs.org/
    echo 2. Download LTS version
    echo 3. Install and restart your computer
    echo.
    pause
    exit /b 1
)

echo ✅ Node.js is installed
echo.

echo Checking if port 8080 is available...
netstat -an | findstr :8080 >nul 2>&1
if %errorlevel% equ 0 (
    echo ⚠️ Port 8080 is busy. Stopping existing processes...
    taskkill /f /im node.exe >nul 2>&1
    timeout /t 2 >nul
)

echo Starting Smart Hostel System Server...
echo.
echo If you see port conflicts, the server will automatically try alternative ports.
echo.
echo Starting server...
node server/index.js

echo.
echo Server stopped. Press any key to exit...
pause >nul
