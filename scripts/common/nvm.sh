#!/usr/bin/env bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
source ~/.nvm/nvm.sh

nvm install 8.6
nvm alias default 8.6

source ~/.bashrc

npm install -g \
	bower \
	diff-so-fancy \
	ember-cli \
	eslint \
	flow-bin \
	http-server \
	jscpd \
	node-sass \
	prettier \
	sass-lint \
	typescript \
	;
