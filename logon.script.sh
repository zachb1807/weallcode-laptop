#!/bin/bash

# Set Background
automator -i /Users/Shared/weallcode-background.png /Users/Shared/setDesktopWallpaper.workflow

# ---------------------------------------------

# Copy robot tester file from shared to home dir
cp /Users/Shared/robot-test.py $HOME/robot-test.py

# ---------------------------------------------

# Open Survey
open https://wac.fyi/survey

# ---------------------------------------------

sleep 1

# Update Dock
# don't set background and update dock back to back, they seem to cause a race condition as they restart the dock/desktop
/usr/local/bin/dockutil --remove all \
    --add /Applications/Google\ Chrome.app \
    --add /Applications/Firefox.app \
    --add /Applications/Visual\ Studio\ Code.app \
    --add /Applications/Unity/Unity.app

# ---------------------------------------------

sleep 1

# Install Python extension for VS Code
# If install fails (likely due to no Internet connection), will retry every 5 seconds
# Sends notification when install is successful
while ! /usr/local/bin/code --install-extension ms-python.python
do
    sleep 5
done
osascript -e 'display notification "Successfully installed VS Code Python extension" with title "Python Extension Installed"'

# ---------------------------------------------

# Install 'weallcode_robot' Python package from pip3
# If install fails (likely due to no Internet connection), will retry every 5 seconds
# Sends notification when install is successful
while ! /usr/local/bin/pip3 install weallcode_robot
do
    sleep 5
done
osascript -e 'display notification "Successfully installed Python package weallcode_robot" with title "Robot Package Installed"'
