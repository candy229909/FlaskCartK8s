# 基於官方 Python 映像
FROM python:3.8-slim

# 設定工作目錄
WORKDIR /app

# 將應用代碼複製到容器中
COPY ./app /app
COPY requirements.txt uwsgi.ini /app/

# 安裝 Python 依賴
RUN pip install --no-cache-dir -r requirements.txt

# 容器對外暴露的端口號
EXPOSE 5000

# 運行 uWSGI 服務器
CMD ["uwsgi", "--ini", "uwsgi.ini"]