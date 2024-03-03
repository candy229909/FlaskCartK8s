#!/bin/bash
##���� unix-like
##�O�o�]�wchmod +x start_app.sh
##./start_app.����

# �T�O�}���b�J����~�ɰ���
set -e

# ���L��e���檺�R�O
set -x

# �ˬd�æw�˵������ҡ]�p�G���s�b�^
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

# �Ұʵ�������
echo "Activating virtual environment..."
source venv/bin/activate

# �w�˨̿�
echo "Installing dependencies from requirements.txt..."
pip install -r requirements.txt

# �Ұ� Flask ����
echo "Starting Flask application..."
export FLASK_APP=wsgi.py
export FLASK_ENV=development  # �γ]�� production �ھڻݭn
flask run --host=0.0.0.0
