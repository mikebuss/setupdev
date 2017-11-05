# Fail on first unsuccessful command
set -e

# Ask for the administrator password upfront.
echo "Script needs sudo access to install software"
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Update OSX
echo "Updating OSX.  If this requires a restart, run the script again."
# Install all available updates
sudo softwareupdate -iva
# Install only recommended available updates
#sudo softwareupdate -irv

echo "------------------------------"
echo "Installing Xcode Command Line Tools."
# Install Xcode command line tools
xcode-select --install


# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Cask
brew tap caskroom/cask

# CLI Applications
brew install gnupg
