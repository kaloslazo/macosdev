#!/bin/bash

# --- system ---
system:sound_off() {
  sudo nvram SystemAudioVolume=" "
}

system:scrollbars() {
  defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
}

system:save_local() {
  defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
}

# --- input ---
input:right_click() {
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
  defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
  defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0
  defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
}

input:tap_click() {
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
  defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
  defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
  defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
}

input:key_speed() {
  defaults write NSGlobalDomain NSTextKillRingSize -int 6
  defaults write NSGlobalDomain KeyRepeat -int 2
  defaults write NSGlobalDomain InitialKeyRepeat -int 15
}

finder:show_files() {
  defaults write com.apple.finder AppleShowAllFiles -bool true
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
}

finder:show_ui() {
  defaults write com.apple.finder ShowStatusBar -bool true
  defaults write com.apple.finder ShowPathbar -bool true
}

finder:compact() {
  defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
  defaults write com.apple.finder NSTableViewDefaultSizeMode -int 1
  defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1
}

finder:no_warnings() {
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
  defaults write com.apple.finder WarnOnEmptyTrash -bool false
}

finder:sidebar() {
  defaults write com.apple.finder ShowRecentTags -bool false
  defaults write com.apple.finder SidebarDevicesSectionDisclosedState -bool true
  defaults write com.apple.finder SidebarPlacesSectionDisclosedState -bool true
  defaults write com.apple.finder SidebarShowingiCloudDesktop -bool false
}

input() {
  # natural scrolling
  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
  defaults write -g com.apple.swipescrolldirection -bool false
}

privacy() {
  # disable spotlight suggestions
  defaults write com.apple.AdLib forceLimitAdTracking -bool true
  defaults write com.apple.AdLib personalizedAdsMigrationComplete -bool true
  defaults write com.apple.AdLib allowApplePersonalizedAdvertising -bool false
  defaults write com.apple.spotlight.Suggestions.plist enabled -bool false
  defaults write com.apple.applicationaccess.new allowDiagnosticSubmission -bool false
  defaults write com.apple.locationd LocationServicesEnabled -bool false
}

finder() {
  # show hidden files
  defaults write com.apple.finder AppleShowAllFiles -bool true

  # show all filename extensions
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  # show path bar
  defaults write com.apple.finder ShowPathbar -bool true

  # show status bar
  defaults write com.apple.finder ShowStatusBar -bool true

  # disable warning when changing file extension
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

  # disable warning when empty trash
  defaults write com.apple.finder WarnOnEmptyTrash -bool false

  # show sidebar
  defaults write com.apple.finder ShowSidebar -bool true
}

sound() {
  # increase sound quality bluetooth
  defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
}

keyboard() {
  # disable capitalization
  defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
  
  # disable smart dashes
  defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

  # disable autocorrect
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

  # when press key repeat instead of accent
  defaults write -g ApplePressAndHoldEnabled -bool false
}

menubar() {
  # show battery percentage
  defaults write com.apple.menuextra.battery ShowPercent -string "YES"

  # show clock without seconds
  defaults write com.apple.menuextra.clock IsAnalog -bool false
  defaults write com.apple.menuextra.clock ShowSeconds -bool false
}

dock() {
  # clean all apps
  defaults write com.apple.dock persistent-apps -array; killall Dock

  # animation faster
  defaults write com.apple.dock autohide-time-modifier -float 0.15

  # minimize windows into application icon
  defaults write com.apple.dock minimize-to-application -bool true

  # effect scale minimize app
  defaults write com.apple.dock mineffect -string "scale"

  # size of icons
  defaults write com.apple.dock tilesize -int 24

  # autohide not enabled
  defaults write com.apple.dock autohide -bool false

  # dont show recent apps
  defaults write com.apple.dock show-recents -bool false

  # show only apps in dock
  defaults write com.apple.dock static-only -bool true

  # dont rearrange spaces
  defaults write com.apple.dock mru-spaces -bool false

  # magnification (hover effect)
  defaults write com.apple.dock magnification -bool true
  defaults write com.apple.dock largesize -int 50

  # delay workspaces
  defaults write com.apple.dock workspaces-edge-delay -float 0.1

  # remove auto workspace change
  defaults write com.apple.dock workspaces-auto-swoosh -bool false
}

screen() {
  # ask password after sleep or screen saver
  defaults write com.apple.screensaver askForPassword -int 1
  defaults write com.apple.screensaver askForPasswordDelay -int 0

  # save screenshots to folder pictures
  defaults write com.apple.screencapture location -string "${HOME}/Pictures"

  # save screenshots in png
  defaults write com.apple.screencapture type -string "png"

  # disable shadow in screenshots
  defaults write com.apple.screencapture disable-shadow -bool true
}

# --- apply all ---
apply() {
  system:sound_off
  system:scrollbars
  system:save_local

  input:right_click
  input:tap_click
  input:key_speed

  finder:show_files
  finder:show_ui
  finder:compact
  finder:no_warnings
  finder:sidebar
  finder:desktop

  privacy:spotlight

  # restart services
  killall Finder
  killall Dock
  killall SystemUIServer

  echo "configuration applied"
}

# run everything
apply