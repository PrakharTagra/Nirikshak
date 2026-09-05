@echo off
setlocal enabledelayedexpansion

echo ======================================================================
echo   NIRIKSHAK COMPLIANCE ENGINE -- RUNNER
echo   Legal Metrology (Packaged Commodities) Rules, 2011
echo ======================================================================
echo.

if "%~1"=="service" goto start_service
if "%~1"=="test" goto run_tests
if "%~1"=="cli" goto run_cli

echo Choose an action:
echo   1. Start Preprocessor Microservice (Stage 2 + 4 FastAPI on port 8000)
echo   2. Run Compliance Inspection CLI (process input/ folder)
echo   3. Run All Test Suites
echo   4. Exit
echo.
set /p choice="Enter choice [1-4]: "

if "%choice%"=="1" goto start_service
if "%choice%"=="2" goto run_cli
if "%choice%"=="3" goto run_tests
if "%choice%"=="4" goto end
goto end

:start_service
echo.
echo [*] Starting Stage 2 Preprocessing & OCR Microservice on port 8000...
cd "%~dp0stage2_preprocessing"
python -m uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
goto end

:run_cli
echo.
echo [*] Running Compliance Pipeline Orchestrator...
cd "%~dp0orchestrator"
node src/cli.js %*
goto end

:run_tests
echo.
echo [*] Running Orchestrator Unit Tests...
cd "%~dp0orchestrator"
node test/testNetQuantityMultiPieceLayer.js
goto end

:end
endlocal
