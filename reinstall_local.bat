@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
if "%SCRIPT_DIR:~-1%"=="\" set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"

set "VENV_PYTHON=%SCRIPT_DIR%\venv\Scripts\python.exe"
set "PROJECT_DIR=%SCRIPT_DIR%"
set "BUILD_DIR=%PROJECT_DIR%\build"

if not exist "%VENV_PYTHON%" (
    echo Virtual environment Python not found at "%VENV_PYTHON%".
    exit /b 1
)

if exist "%BUILD_DIR%" (
    echo Removing build directory...
    rmdir /s /q "%BUILD_DIR%"
)

echo Uninstalling calibreweb...
"%VENV_PYTHON%" -m pip uninstall -y calibreweb

echo Installing calibreweb from current directory...
"%VENV_PYTHON%" -m pip install "%PROJECT_DIR%"

endlocal
