FROM python:3.8-slim
WORKDIR /app
COPY requirements.txt requirements.txt

RUN apt-get update && apt-get install -y bc make

RUN pip install -r requirements.txt

COPY script/lintage /app/script/lintage
COPY entrypoint.sh /app
COPY Makefile /app
ENTRYPOINT ["/app/entrypoint.sh"]