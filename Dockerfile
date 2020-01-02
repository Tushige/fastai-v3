FROM python:3.7-slim-stretch

RUN pip uninstall PIL
RUN pip install pillow
RUN apt-get update && build-dep python-pillow && apt-get install -y git python3-dev gcc \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --upgrade -r requirements.txt

COPY app app/

RUN python app/server.py

EXPOSE 5000

CMD ["python", "app/server.py", "serve"]
