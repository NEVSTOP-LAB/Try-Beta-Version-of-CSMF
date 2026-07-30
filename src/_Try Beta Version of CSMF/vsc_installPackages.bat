@echo off
setlocal enabledelayedexpansion

set "VSIX_PATH=%~1"

if "%VSIX_PATH%"=="" (
    echo [ERROR] VSIX path is required. Usage: %~nx0 ^<path-to-vsix^> 1>&2
    exit /b 1
)

if not exist "%VSIX_PATH%" (
    echo [ERROR] File not found: "%VSIX_PATH%" 1>&2
    exit /b 1
)

REM Try to locate code.cmd / code.exe
set "CODE_CMD="
for %%C in (code.cmd code) do (
    where %%C >nul 2>&1
    if not errorlevel 1 (
        set "CODE_CMD=%%C"
    )
)

if "%CODE_CMD%"=="" (
    echo [ERROR] VS Code CLI 'code' not found in PATH. 1>&2
    exit /b 1
)

REM Install the VSIX silently; on failure, re-run to show the error
"%CODE_CMD%" --install-extension "%VSIX_PATH%" --force >nul 2>&1
if errorlevel 1 (
    "%CODE_CMD%" --install-extension "%VSIX_PATH%" --force 1>&2
    exit /b 1
)

endlocal
