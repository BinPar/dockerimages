#!/bin/bash
set -e
apt-get install build-essential clang libdbus-1-dev libgtk2.0-dev \
                       libnotify-dev libgnome-keyring-dev libgconf2-dev \
                       libasound2-dev libcap-dev libcups2-dev libxtst-dev \
                       gcc-multilib g++-multilib \
                       libgtk2.0-0 libgconf-2-4 \
                       libasound2 libxtst6 libxss1 libnss3 xvfb -y