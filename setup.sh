#!/bin/bash
#Last update: May 19, 2015

# setup terminal (pro, menlo ft 18)

# Many ideas from: http://blog.apps.npr.org/2013/06/06/how-to-setup-a-developers-environment.html
xcode-select --install

echo "Installing Brew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

echo "Updating Brew"
brew update

echo "Make .ssh folder"
mkdir ~/.ssh

#Bash profile
nano ~/.bashrc
alias ll="ls -al"
export PATH=$HOME/local/bin:$PATH
alias git-branch-clean="git branch --merged | grep -v \"\*\" | grep -v master | grep -v develop | xargs -n 1 git branch -d"
alias git-stash-diff="git stash show -p stash@{0}"
alias vbox-edge-box-cam-attach="VBoxManage controlvm \"IE11 - Win10\" webcam attach .1"
alias vbox-edge-box-cam-detach="VBoxManage controlvm \"IE11 - Win10\" webcam detach .1"
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
source ~/.bash_profile

echo "Installing Cask..."
brew install caskroom/cask/brew-cask
brew upgrade brew-cask && brew cleanup && brew cask cleanup
source ~/.bash_profile

echo "Install apps"
brew cask install google-chrome-beta
brew cask install google-drive
brew cash install virtualbox
brew cask install sequel-pro
brew cask install atom
brew cask install slack
brew cask install java
brew cask install openemu

brew install gcc
brew install bash-git-prompt
brew install git bash-completion

echo "Install nvm"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
echo "source ~/.bashrc" >> ~/.bash_profile
source ~/.bash_profile

echo "Install atom plugins"
apm i atom-beautify editorconfig file-icons linter linter-jscs linter-jshint merge-conflicts minimap tabs-to-spaces pigments tag jscs-fixer linter-jsonlint atom-typescript
