FROM python:slim

WORKDIR /server

COPY requirements.txt .

RUN python3 -m venv .venv
RUN .venv/bin/pip install -r requirements.txt

COPY app.env .env

COPY app.py .

CMD [".venv/bin/python3", "app.py"]

