# ���x�� Python �M��
FROM python:3.8-slim

# �]�w�u�@�ؿ�
WORKDIR /app

# �N���ΥN�X�ƻs��e����
COPY ./app /app
COPY requirements.txt uwsgi.ini /app/

# �w�� Python �̿�
RUN pip install --no-cache-dir -r requirements.txt

# �e����~���S���ݤf��
EXPOSE 5000

# �B�� uWSGI �A�Ⱦ�
CMD ["uwsgi", "--ini", "uwsgi.ini"]