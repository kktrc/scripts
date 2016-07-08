#install xcode command line 
xcode-select --install

#install brew 
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#install wget 
brew install wget

#install httpie
brew install httpie

#install mysql
brew mysql

#install redis
brew install redis

#install nginx
brew install nginx

#install brew cask
brew tap caskroom/cask

#install chrome
brew cask install google-chrome
#install postman
brew cask install postman

#install appcleaner
brew cask install appcleaner

#insrtall sourcetree
brew cask install sourcetree

#install github
brew cask install github

#install caffeine
brew cask install caffeine

#install iterm2
brew cask install iterm2

#install virtualbox
brew cask install virtualbox

#install sublime-text 3
brew tap caskroom/versions
brew cask install sublime-text3

#install shadowsocks
brew cask install shadowsocksx

#install launchrocket
brew cask install launchrocket

#install zsh
brew install zsh

#install oh-my-zsh
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#install nvm
brew install nvm

#export nvm path
cat>>.zshrc<<EOF
export NVM_DIR="$HOME/.nvm"
 . "$(brew --prefix nvm)/nvm.sh"
EOF

#install rvm
brew install gpg
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable

source ~/.zshrc

rvm install 2.3.1

#install cocoapods
gem install cocoapods

#install pyenv
brew install pyenv
#set pyenv path
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
exec $SHELL -l

brew install mercurial
pyevn install 2.7.11
pyenv install 3.6-dev

pyenv rehash
pyenv versions
pyenv global 2.7.11
pyenv versions

git config --global user.name "pzzls"
git config --global user.email moshenglei@icloud.com

#install docker
brew install boot2docker

