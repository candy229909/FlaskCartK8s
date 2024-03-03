REM windows專用

@echo off

REM 檢查虛擬環境是否存在，如果不存在則創建
if not exist "venv" (
    echo Creating virtual environment...
    python -m venv venv
)

REM 啟動虛擬環境
echo Activating virtual environment...
call venv\Scripts\activate.bat

REM 安裝依賴
echo Installing dependencies from requirements.txt...
pip install -r requirements.txt

REM 設置 Flask 應用的環境變量
set FLASK_APP=wsgi.py
set FLASK_ENV=development

REM 啟動 Flask 應用
echo Starting Flask application...
flask run --host=0.0.0.0