FROM ubuntu:22.04

WORKDIR /app

# install curl, python3, and python package installer
RUN apt-get update \
    && apt-get install -y curl python3 python3-pip \
    && apt-get clean 

# install ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

COPY . /app

# install pip requirements
RUN pip3 install --upgrade pip \
    && pip3 install -r /app/requirements.txt

EXPOSE 3000

ENTRYPOINT ["/app/entrypoint.sh"]