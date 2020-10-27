# -- Base Node ---
FROM node:12-alpine AS base
WORKDIR /usr/src/app
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories
RUN apk update
RUN apk add --no-cache mongodb mongodb-tools
RUN apk --update add tar
RUN mkdir -p /data/db
RUN  mkdir -p /data/backups
