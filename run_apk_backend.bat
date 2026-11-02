@echo off
title Nirikshak APK Backend Service
echo ======================================================================
echo   NIRIKSHAK -- APK MOBILE APP BACKEND SERVICE
echo   Connecting Android Mobile Field Inspector App to MongoDB Atlas
echo ======================================================================
echo.

cd /d "%~dp0apkbackend"

if not exist "node_modules" (
    echo [*] Installing apkbackend npm dependencies...
    call npm install
)

echo [*] Starting Nirikshak APK Backend on port 5005 (or PORT in .env)...
echo [*] Local URL: http://localhost:5005
echo [*] Android Emulator URL: http://10.0.2.2:5005
echo [*] Health Check: http://localhost:5005/health
echo.
node server.js
pause
