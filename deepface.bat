@echo off
setlocal

cd /d "%~dp0"

REM --- find python ---
where py >nul 2>nul
if %errorlevel%==0 (
  set "PY=py"
) else (
  where python >nul 2>nul
  if %errorlevel%==0 (
    set "PY=python"
  ) else (
    echo Python not found. Install Python 3.10+ and restart terminal.
    pause
    exit /b 1
  )
)

REM --- venv ---
if not exist ".venv\Scripts\python.exe" (
  %PY% -m venv .venv
)

call ".venv\Scripts\activate.bat"

python -m pip install --upgrade pip

if exist "requirements.txt" (
  pip install -r requirements.txt
) else (
  echo requirements.txt not found!
  pause
  exit /b 1
)

python launcher.py
pause