#!/bin/bash

set -e
set -x

echo 'deb-src http://us.archive.ubuntu.com/ubuntu/ xenial main restricted' | sudo tee --append /etc/apt/sources.list

sudo apt-get install -f -y

# run update to make the new repo available
sudo apt-get update -y
