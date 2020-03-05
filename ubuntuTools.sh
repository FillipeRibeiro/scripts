#!/bin/bash

# UPDATE
echo UPDATING
sudo -S <<< "password" apt-get update -y

# VIM
echo INSTALLING VIM
sudo -S <<< "password" apt-get install vim -y

# GIT
echo INSTALLING GIT
sudo -S <<< "password" apt-get install git -y
echo INSTALLING GITFLOW
sudo -S <<< "password" apt-get install git-flow -y

# PHP7
echo INSTALLING PHP7
sudo -S <<< "password" apt-get install php -y
sudo -S <<< "password" apt-get install curl php-cli php-mbstring unzip -y

# composer
echo INSTALLING COMPOSER
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
# using composer globally
if [ -e /usr/bin/local/composer ]
then
    mv composer.phar /usr/bin/local/composer
else
    mv composer.phar /usr/bin/composer
fi

# NODE
echo INSTALLING NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="$HOME/.nvm" 
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source ~/.bashrc
source ~/.nvm/nvm.sh
nvm use stable #installing a stable version of nodejs

# Docker
echo INSTALING DOCKER
sudo -S <<< "password" apt-get update
sudo -S <<< "password" apt-get remove docker docker-engine docker.io
sudo -S <<< "password" apt-get install docker.io
sudo -S <<< "password" systemctl start docker
sudo -S <<< "password" systemctl enable docker

# HTOP
echo INSTALING HTOP
sudo -S <<< "password" apt-get install htop

# SUBLIME TEXT
echo INSTALING SUBLIME TEXT
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
echo updating repository added
sudo -S <<< "password" apt-get update -y
echo finally installing sublime
sudo apt-get install sublime-text -y
# to uninstall sublime
# sudo -S <<< "password" apt-get remove sublime-text && sudo apt-get autoremove

# VS CODE
echo INSTALING VS CODE
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo -S <<< "password" install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo -S <<< "password" sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo -S <<< "password" apt-get install apt-transport-https -y
sudo -S <<< "password" apt-get update -y
sudo -S <<< "password" apt-get install code -y # or code-insiders
#sudo -S <<< "password" snap install code -y

# TERMINATOR
echo INSTALING TERMINATOR
sudo -S <<< "password" add-apt-repository ppa:gnome-terminator -y
sudo -S <<< "password" apt-get update -y
sudo -S <<< "password" apt-get install terminator -y

# MYSQL WORKBENCH
echo INSTALING MYSQL WORKBENCH
sudo -S <<< "password" apt update -y
sudo -S <<< "password" apt install mysql-workbench -y

# ZSH E OH-MY-ZSH
echo INSTALLING ZSH
sudo -S <<< "password" apt-get install zsh -y
chsh -s $(which zsh)
# installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#logout from shell
echo PLEASE REBOOT YOU TERMINAL