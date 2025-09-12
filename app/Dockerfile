# FROM python:3.13-slim
# WORKDIR /app
# COPY app/requirements.txt .
# RUN pip install gunicorn
# RUN pip install -r requirements.txt
# ENV PORT=80
# CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 main:app

# Use Python oficial
FROM python:3.12-slim

# Define diretório de trabalho
WORKDIR /app

# Copia arquivos necessários
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Define porta exposta
EXPOSE 8080

# Comando para rodar o app
CMD ["python", "main.py"]


