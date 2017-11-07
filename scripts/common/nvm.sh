#!/usr/bin/env bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
source ~/.nvm/nvm.sh

nvm install 8.6
nvm alias default 8.6

source ~/.bashrc
npm install -g ember-cli eslint jscpd prettier typescript flow-bin  diff-so-fancy
