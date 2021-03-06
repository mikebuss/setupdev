#!/usr/bin/env bash

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
brew install mas # Mac App Store CLI tool

# Dependencies for Postgres
brew install libpqxx

# Git
brew install git git-lfs git-flow git-extras
git config --global user.name "Mike Buss"
git config --global user.email mike@mikebuss.com
git config --global core.editor vim
git config lfs.https://git.myresearchapp.com/mbuss/MyHealth.git/info/lfs.locksverify true

# GPG
brew install gnupg gnupg2

# RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

\curl -sSL https://get.rvm.io | bash -s stable

# Ruby
rvm install 2.6.3
rvm use 2.6.3 --default

# Redis
brew install redis

# CLI Utilities
brew install speedtest_cli
brew install tmux

# GUI Applications
brew cask install --appdir="/Applications" 1password
brew cask install --appdir="~/Applications" iterm2
# brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" macdown
brew cask install --appdir="/Applications" kaleidoscope
brew cask install --appdir="/Applications" paw
brew cask install --appdir="/Applications" postgres
brew cask install --appdir="/Applications" transmit
brew cask install --appdir="/Applications" visual-studio-code

# Mac App Store Applications
mas install 497799835 # Xcode

# Accept the Xcode license
sudo /usr/sbin/DevToolsSecurity -enable
sudo /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild -license accept

xcode-select --version
if [ $? -eq 0 ]; then
 echo "Xcode tools are installed already."
else
  # Install additional components for Xcode
  sudo /usr/sbin/installer -pkg /Applications/Xcode.app/Contents/Resources/Packages/MobileDevice.pkg -target /
  sudo /usr/sbin/installer -pkg /Applications/Xcode.app/Contents/Resources/Packages/MobileDeviceDevelopment.pkg -target /
fi

# SSH Key Setup
# if [ ! -f ~/.ssh/id_rsa ]; then
#   mkdir ~/.ssh
#   ssh-keygen -t rsa -b 4096 -C "mike@mikebuss.com" -f $HOME/.ssh/id_rsa
#   pbcopy < ~/.ssh/id_rsa.pub
#   echo "SSH public key copied to clipboard."
#   echo "Add this SSH key to external services (GitHub, BitBucket, etc) and press enter to continue."
#   read  -n 1 -p "Press Enter to continue." einput
# fi
eval "$(ssh-agent -s)" # Start the SSH Agent
# ssh-add -K ~/.ssh/id_rsa # Add the SSH key

# GPG keys
if [[ $(gpg --list-keys | grep "Mike Buss" | wc -l | tr -d ' ') = "0" ]]; then # Trim spaces with "tr -d ''"
  echo "No GPG key found. Creating..."
  gpg --gen-key

  echo "GPG key created. You will need to add this key to external services. To view the key, run: "
  echo "gpg --armor --export YOURKEYHERE | pbcopy"
  echo "And grab the key AFTER THE SLASH in the line starting with 'sec'"
fi

echo "Configuring git for GPG signing"
gpg --list-secret-keys --keyid-format LONG
git config --global commit.gpgsign true
git config --global gpg.program $(which gpg) # Fix GUI's for git

LINE='export GPG_TTY=$(tty)'
FILE=~/.bashrc
grep -qF "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

FILE=~/.zshrc
grep -qF "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

# Cleanup brew
brew cleanup
