@echo off
title Nirikshak Compliance Engine Service
echo ======================================================================
echo   NIRIKSHAK -- COMPLIANCE ENGINE MICROSERVICES
echo   Legal Metrology (Packaged Commodities) Rules, 2011
echo ======================================================================
echo.
echo Choose how to run the Compliance Engine:
echo   1. Start Full Background Services (Port 8000 Python OCR + Port 3000 Node API)
echo   2. Run Single-Command Scan on an Image Folder (scan.py)
echo   3. Test with Sample Images (ComplianceEngine/orchestrator/input)
echo   4. Exit
echo.
set /p choice="Enter choice [1-4]: "

if "%choice%"=="1" goto start_services
if "%choice%"=="2" goto run_scan_prompt
if "%choice%"=="3" goto run_sample
if "%choice%"=="4" goto end
goto end

:start_services
echo.
echo [*] Launching Python Stage 2 Preprocessing ^& OCR on port 8000 in background...
start "Nirikshak Python OCR Microservice (:8000)" cmd /k "cd /d %~dp0ComplianceEngine\stage2_preprocessing && python -m uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload"
timeout /t 3 /nobreak >nul

echo [*] Launching Node.js Compliance Orchestrator API on port 3000...
cd /d "%~dp0ComplianceEngine\orchestrator"
node src/server.js
goto end

:run_scan_prompt
echo.
set /p folder="Enter path to packaging images folder: "
cd /d "%~dp0"
python scan.py "%folder%"
pause
goto end

:run_sample
echo.
echo [*] Running scan on sample images in ComplianceEngine/orchestrator/input...
cd /d "%~dp0"
python scan.py "ComplianceEngine/orchestrator/input"
pause
goto end

:end
