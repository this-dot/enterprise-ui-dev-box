curl -L http://install.ohmyz.sh | sh
sudo usermod -s `which zsh` vagrant

sed -i 's/plugins=(git)/plugins=(alias-tips\ cp\ extract\ git\ git-extras\ jsontools\ nvm\ zsh-autosuggestions\ zsh-completions\ zsh-syntax-highlighting)/' ~/.zshrc
