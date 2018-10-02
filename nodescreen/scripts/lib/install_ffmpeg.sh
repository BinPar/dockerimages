#!/bin/bash
set -e
apt-get install software-properties-common -y
add-apt-repository ppa:mc3man/trusty-media -y
apt-get update -y
apt-get dist-upgrade -y
apt-get install ffmpeg -y
