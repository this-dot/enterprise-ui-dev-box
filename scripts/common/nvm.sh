#!/usr/bin/env bash
source ~/.zshrc
export SHELL=$(which zsh)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
source ~/.zshrc

nvm install 8.6
nvm alias default 8.6

source ~/.bashrc

npm install -g \
	bower \
	create-react-app \
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
