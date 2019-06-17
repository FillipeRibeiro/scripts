# Install brew
echo INSTALING BREW
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install php
echo INSTALING PHP
brew install php72
#brew install php72-pcntl

# instaling node
echo INSTALING NODE
brew install node

#brew install mariadb
#brew services start mariadb
#brew install redis
#brew services start redis

# Install brew cask
#brew tap caskroom/cask

# TOOLS
echo instaling tools
# Install apps with GUI
#brew cask install phpstorm
#brew cask install pycharm-ce
#brew cask install datagrip
echo instaling vsCode
brew cask install visual-studio-code
#brew cask install clipy
#brew cask install docker

echo instaling postman
brew cask install postman

echo instaling chrome
brew cask install google-chrome

echo instaling firefox
brew cask install firefox

#brew cask install spotify
#brew cask install telegram
#brew cask install slack
#brew cask install whatsapp

# Install composer
echo instaling composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer
