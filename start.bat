REM windows�M��

@echo off

REM �ˬd�������ҬO�_�s�b�A�p�G���s�b�h�Ы�
if not exist "venv" (
    echo Creating virtual environment...
    python -m venv venv
)

REM �Ұʵ�������
echo Activating virtual environment...
call venv\Scripts\activate.bat

REM �w�˨̿�
echo Installing dependencies from requirements.txt...
pip install -r requirements.txt

REM �]�m Flask ���Ϊ������ܶq
set FLASK_APP=wsgi.py
set FLASK_ENV=development

REM �Ұ� Flask ����
echo Starting Flask application...
flask run --host=0.0.0.0