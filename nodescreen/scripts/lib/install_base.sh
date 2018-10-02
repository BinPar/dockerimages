#!/bin/bash
set -e
apt-get update -y
apt-get -y upgrade
apt-get install -y build-essential
apt-get install -y software-properties-common
apt-get install -y curl git unzip wget bzip2 python
