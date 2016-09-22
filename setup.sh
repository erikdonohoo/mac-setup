#!/bin/bash
#Last update: May 19, 2015

# Many ideas from: http://blog.apps.npr.org/2013/06/06/how-to-setup-a-developers-environment.html
xcode-select --install

echo "Installing Brew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

echo "Updating Brew"
brew update

#Bash profile
nano ~/.bash_profile
export PATH=/usr/local/bin:$PATH
source ~/.bash_profile

echo "Installing Cask..."
brew install caskroom/cask/brew-cask
brew upgrade brew-cask && brew cleanup && brew cask cleanup

# VirtualEnv & Python Setup
export PATH=/usr/local/lib/python2.7/site-packages:$PATH
source ~/.bash_profile
sudo easy_install pip
sudo pip install virtualenv virtualenvwrapper
nano ~/.bash_profile
source /usr/local/bin/virtualenvwrapper_lazy.sh
less ~/.bash_profile
sudo pip install numpy

brew cask install google-chrome
brew cask install dropbox
brew cask install google-drive
brew cask install evernote
brew cask install handbrake
brew cask install kindle
brew cask install things
#brew cask install lorem
brew cask install papers
brew cask install sketchup
brew cask install spotify

brew tap homebrew/science
brew install gcc
brew install Caskroom/cask/xquartz
brew install r
brew install libssh2


#brew cask install R
brew cask install rstudio
brew install jags

echo "Installing R Packages"
$ R
	install.packages("runjags")
	install.packages("coda")
	install.packages("dplyr")
$q()
$n

brew cask install sublimetext
	#Install R Package Control https://packagecontrol.io/installation
	#Install R-Box
brew cask install virtualbox

# brew cask install x11vnc ??
brew install git
brew install bash-git-prompt
brew install git bash-completion

brew install node
#brew install zsh
export NODE_PATH=/usr/local/lib/node_modules
brew install npm
brew cask install sequel-pro
brew cask install webstorm
brew cask install intellij-ce
brew cask install atom
	# atom-beautify
	# editorconfig
	# file-icons
	# language-r
	# linter
	# linter-jscs
	# linter-jshint
	# merge-conflicts
	# minimap
	# repl-term
	# tab-to-spaces

#Install Browser-sycn and Gulp
npm install browser-sync gulp --save-dev

# Microsoft Office
# Adobe CC
# Adobe CS6 Illustrator and InDesign
# things
# Sequel pro
# TextWrangler
# VPN Client
