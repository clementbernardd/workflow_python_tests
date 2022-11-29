FROM python:3.8-slim
WORKDIR /app
COPY requirements.txt requirements.txt

RUN apt-get update && apt-get install -y bc make

RUN pip install -r requirements.txt
RUN set -euxo # Enable to stop the code when there is an error

COPY script/lintage /app/script/lintage
COPY entrypoint.sh /app
COPY Makefile /app
ENTRYPOINT ["/app/entrypoint.sh"]