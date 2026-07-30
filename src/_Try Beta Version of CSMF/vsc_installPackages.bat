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

REM Locate code.cmd with full absolute path
set "CODE_CMD="

REM Try PATH lookup via where, capture the absolute path
for /f "delims=" %%F in ('where code.cmd 2^>nul') do (
    if not defined CODE_CMD set "CODE_CMD=%%F"
)

REM If not found, try common VS Code install locations
if not defined CODE_CMD (
    for %%D in (
        "%LOCALAPPDATA%\Programs\Microsoft VS Code\bin\code.cmd"
        "%ProgramFiles%\Microsoft VS Code\bin\code.cmd"
        "%ProgramFiles(x86)%\Microsoft VS Code\bin\code.cmd"
    ) do (
        if exist %%D (
            if not defined CODE_CMD set "CODE_CMD=%%D"
        )
    )
)

if not defined CODE_CMD (
    echo [ERROR] VS Code CLI 'code' not found in PATH or common install locations. 1>&2
    exit /b 1
)

REM Install the VSIX silently; on failure, re-run to show the error
"%CODE_CMD%" --install-extension "%VSIX_PATH%" --force >nul 2>&1
if errorlevel 1 (
    "%CODE_CMD%" --install-extension "%VSIX_PATH%" --force 1>&2
    exit /b 1
)

endlocal
