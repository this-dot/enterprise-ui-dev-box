#!/bin/bash

set -e
set -x

echo 'deb-src http://us.archive.ubuntu.com/ubuntu/ xenial main restricted' | sudo tee --append /etc/apt/sources.list

sudo apt-get install -f -y
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:apt-fast/stable -y
sudo add-apt-repository ppa:git-core/ppa -y

# run update to make the new repo available
sudo apt-get update -y

sudo apt-get -y install apt-fast aria2

#apt-fast is a wrapper for apt-get that makes best utilization of fast bandwidth
echo "DOWNLOADBEFORE=true" | sudo tee --append /etc/apt-fast.conf
echo "_MAXNUM=10" | sudo tee --append /etc/apt-fast.conf
echo "_MAXCONPERSRV=10" | sudo tee --append /etc/apt-fast.conf
echo "MIRRORS=( 'http://archive.ubuntu.com/ubuntu, http://de.archive.ubuntu.com/ubuntu, http://mirrors.piconets.webwerks.in/ubuntu, http://mirror.0x.sg/ubuntu' )" | sudo tee --append /etc/apt-fast.conf


# Install all modules in one shot to optimize build times
sudo apt-fast install \
	autoconf \
	autojump \
	automake \
	build-essential \
	checkinstall \
	curl \
	dkms \
	gcc \
	git \
	git-extras \
	less \
	libbz2-dev \
	libc6-dev \
	libgdbm-dev \
	libncursesw5-dev \
	libreadline-gplv2-dev \
	libsqlite3-dev \
	libssl-dev \
	libtool \
	libtool-bin \
	make \
	python-dev \
	python-software-properties \
	ruby \
	shellcheck \
	silversearcher-ag \
	tk-dev \
	traceroute \
	tree \
	unzip \
	vim \
	virtualbox-guest-dkms \
	zip \
	zsh \
	-y

sudo apt-get update --fix-missing -y

sudo apt-get install -f -y
