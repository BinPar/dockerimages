#!/bin/bash
set -e
add-apt-repository ppa:ubuntu-toolchain-r/test -y
apt-get -y update
apt-get install gcc -y
apt-get upgrade libstdc++6 -y