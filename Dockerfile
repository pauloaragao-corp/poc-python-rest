FROM python:3.9-slim

# Instala cron
RUN apt-get update && apt-get install -y cron

# Define o diretório de trabalho
WORKDIR /usr/src/app

# Copia o script Python para o contêiner
COPY rest.py .

# Instala as dependências do script Python
RUN pip install requests

# Copia o crontab para o contêiner
COPY crontab /etc/cron.d/rest_cron

# Dá permissão ao crontab
RUN chmod 0644 /etc/cron.d/rest_cron

# Aplica o crontab
RUN crontab /etc/cron.d/rest_cron

# Cria o diretório de logs do cron
RUN touch /var/log/cron.log

# Comando para rodar o cron e manter o contêiner ativo
CMD cron && tail -f /var/log/cron.log

