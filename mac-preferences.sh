echo "Setting Mac preferences..."

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Always show scrollbars
# Possible values: `WhenScrolling`, `Automatic` and `Always`
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# System Preferences > Trackpad > Uncheck Scroll Direction: Natural
defaults write -g com.apple.swipescrolldirection -bool false

# System Preferences > Trackpad > Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

###############################################################################
# Dock / Hot Corners                                                          #
###############################################################################

# System Preferences > Dock > Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Remove all app icons from Dock
defaults write com.apple.dock persistent-apps -array

# Set hot corners
  # Corners:
  #  br: bottom-right
  #  bl: bottom-left
  #  tr: top-right
  #  tl: top-left
  # Possible values:
  #  0: no-op
  #  2: Mission Control
  #  3: Show application windows
  #  4: Desktop
  #  5: Start screen saver
  #  6: Disable screen saver
  #  7: Dashboard
  # 10: Put display to sleep
  # 11: Launchpad
  # 12: Notification Center
  # 13: Lock Screen
# Upper right: notification center
defaults write com.apple.dock wvous-tr-corner -int 12
defaults write com.apple.dock wvous-tr-modifier -int 0
# Lower right: desktop
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0
# Lower left: lock screen
defaults write com.apple.dock wvous-bl-corner -int 13
defaults write com.apple.dock wvous-bl-modifier -int 0

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: allow quitting via Cmd + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Default to opening new finder folder in Home folder
loggedInUser=`whoami`
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file:///Users/$loggedInUser/"

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show tab view
defaults write com.apple.finder ShowTabView -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

###############################################################################
# Kill affected applications                                                  #
###############################################################################
echo "Killing affected applications..."

for app in \
  "cfprefsd" \
  "Dock" \
  "Finder"
do
  killall "${app}" &> /dev/null
done

echo "Done! Note that some of these changes require a logout/system restart to take effect."
