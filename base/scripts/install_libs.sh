#!/bin/bash
set -e
add-apt-repository ppa:ubuntu-toolchain-r/test -y
apt-get -y update
apt install gcc
apt-get upgrade libstdc++6 -y