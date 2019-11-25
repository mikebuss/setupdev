# Cask
brew tap caskroom/cask

# Setup macOS
# Disable the sound effects on boot
#sudo nvram SystemAudioVolume=" "
# Disable Resume system-wide
#defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false
# Never go into computer sleep mode
#sudo systemsetup -setcomputersleep Off > /dev/null
# Check for software updates daily, not just once per week
#defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
# Disable smart quotes as they’re annoying when typing code
#defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Disable smart dashes as they’re annoying when typing code
#defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Require password immediately after sleep or screen saver begins
#defaults write com.apple.screensaver askForPassword -int 1
#defaults write com.apple.screensaver askForPasswordDelay -int 0
# Enable two-button mouse (requires restart)
#defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode TwoButton
# Don’t display the annoying prompt when quitting iTerm
#defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# CLI
brew install youtube-dl

# GUI Applications
brew cask install --appdir="~/Applications" little-snitch
brew cask install --appdir="~/Applications" iterm2
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" 1password
brew cask install --appdir="~/Applications" sketch
# brew cask install --appdir="/Applications" skype
#brew cask install --appdir="/Applications" google-backup-and-sync
brew cask install --appdir="/Applications" macdown
#brew cask install --appdir="/Applications" simplenote
brew cask install --appdir="/Applications" bartender
brew cask install --appdir="/Applications" numi
#brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" transmit
# brew cask install --appdir="/Applications" tripmode
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" caffeine
brew cask install --appdir="~/Applications" microsoft-office
brew cask install --appdir="~/Applications" adobe-creative-cloud

# Apps from the Mac App Store
#mas install 904280696 # Things 3
mas install 924726344 # Deliveries
mas install 975937182 # Fantastical 2
#mas install 578071639 # Promotee
#mas install 425955336 # Skitch
mas install 935235287 # Encrypto
mas install 1191449274 # Toothfairy for Bluetooth devices

# Setup Oh-my-zsh
if [ ! -f ~/.zshrc ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo "One or more actions may require a reboot to take effect."
