# # For more information, please refer to https://aka.ms/vscode-docker-python
# # FROM python:3.9-slim
# FROM tiangolo/uwsgi-nginx-flask:python3.8-alpine

# # EXPOSE 8080

# # # Keeps Python from generating .pyc files in the container
# # ENV PYTHONDONTWRITEBYTECODE=1

# # # Turns off buffering for easier container logging
# # ENV PYTHONUNBUFFERED=1

# # Install pip requirements
# RUN pip install --upgrade pip
# COPY requirements.txt .
# # RUN pip install --trusted-host=pypi.python.org --trusted-host=pypi.org --trusted-host=files.pythonhosted.org --upgrade torch 1.8.1
# # RUN pip install --trusted-host=pypi.python.org --trusted-host=pypi.org --trusted-host=files.pythonhosted.org torch==1.8.1 -f https://download.pytorch.org/whl/torch_stable.html
# RUN pip install -r requirements.txt


# WORKDIR /app
# COPY . /app

# # Creates a non-root user with an explicit UID and adds permission to access the /app folder
# # For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
# # RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
# # USER appuser

# # During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
# # CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]

# ENTRYPOINT [ "python" ]

# CMD [ "app.py" ]



# ---------------------------------------------


FROM ubuntu:20.04

RUN apt-get update -y

RUN apt-get install -y python3-pip python3-dev build-essential

COPY . /app

WORKDIR /app

RUN pip3 install -r requirements.txt
RUN apt install libtinfo5
RUN ["apt-get", "-y", "install", "vim"]
RUN ["apt-get", "-y", "install", "nano"]
# ENTRYPOINT ["python3"]

# CMD ["app.py"]

# CMD ["gunicorn", "--bind", ":$PORT", "app:app"]
CMD gunicorn --bind 0.0.0.0:$PORT app:app