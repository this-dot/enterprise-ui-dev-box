#!/usr/bin/env bash

curl --silent https://bootstrap.pypa.io/get-pip.py | sudo python
sudo pip install httpie glances

git clone --depth 1 https://github.com/junegunn/fzf.git ${HOME}/.fzf \
	&& ${HOME}/.fzf/install --all
cd ${HOME}
