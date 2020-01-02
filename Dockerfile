FROM python:3.7-slim-stretch

RUN pip uninstall PIL
RUN sudo apt-get install python3-dev python3-setuptools
RUN pip install pillow==5.1.0 torchvision==0.2.1
RUN apt-get update && apt-get install -y git python3-dev gcc \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --upgrade -r requirements.txt

COPY app app/

RUN python app/server.py

EXPOSE 5000

CMD ["python", "app/server.py", "serve"]
