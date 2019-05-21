#!/bin/sh
set -e
apk update && apk upgrade
apk add unzip bzip2
