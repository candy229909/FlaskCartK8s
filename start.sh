#!/bin/bash
##環境 unix-like
##記得設定chmod +x start_app.sh
##./start_app.執行

# 確保腳本在遇到錯誤時停止
set -e

# 打印當前執行的命令
set -x

# 檢查並安裝虛擬環境（如果不存在）
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

# 啟動虛擬環境
echo "Activating virtual environment..."
source venv/bin/activate

# 安裝依賴
echo "Installing dependencies from requirements.txt..."
pip install -r requirements.txt

# 啟動 Flask 應用
echo "Starting Flask application..."
export FLASK_APP=wsgi.py
export FLASK_ENV=development  # 或設為 production 根據需要
flask run --host=0.0.0.0
