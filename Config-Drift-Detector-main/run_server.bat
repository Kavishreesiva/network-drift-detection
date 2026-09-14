@echo off
echo ==========================================================
echo 🛡️ Starting CCNA Network & Cloud Config Drift Detector...
echo ==========================================================
cd /d "%~dp0"
backend\venv\Scripts\python.exe -m uvicorn backend.app:app --host 127.0.0.1 --port 8001 --reload
pause
