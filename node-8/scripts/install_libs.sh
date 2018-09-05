#!/bin/bash
set -e
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt-get -y update
sudo apt-get install gcc-4.9 -y
sudo apt-get upgrade libstdc++6 -y