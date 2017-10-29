#!/usr/bin/env bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
source ~/.nvm/nvm.sh

nvm install 8
nvm alias default 8
