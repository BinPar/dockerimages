FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
  curl

WORKDIR /opt/app

COPY . .

RUN sh ./scripts/installNode.sh

RUN sh ./scripts/installDependencies.sh