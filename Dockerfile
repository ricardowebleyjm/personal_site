FROM python:3.11-slim

RUN apt-get update
RUN apt-get -y install curl
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - &&\
    apt-get install -y nodejs

WORKDIR /code

COPY requirements.txt /code/
COPY . ./code

RUN pip install -r requirements.txt


EXPOSE 9090
ENTRYPOINT ["sh", "entrypoint.sh"]