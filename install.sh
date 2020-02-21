#!/bin/bash
set -e
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

[[ -d submodules/iterm-notify ]] || git clone https://github.com/marzocchi/iterm-notify submodules/iterm-notify
[[ -f submodules/iterm-notify/notify.py ]] || echo Missing iterm-notify
[[ -d ~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch ]] || mkdir -p ~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch
[[ -f ~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch/iterm-notify.py ]] || cp submodules/iterm-notify/notify.py ~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch/iterm-notify.py
[[ -f ~/.iterm-notify-init.sh ]] || cp submodules/iterm-notify/init.sh ~/.iterm-notify-init.sh
[[ -f ~/.iterm-notify-identity ]] || openssl rand -base64 32|head -n1 > ~/.iterm-notify-identity && chmod 0600 ~/.iterm-notify-identity


grep -q iterm-notify-init ~/.profile.sh || echo 'source ~/.iterm-notify-init.sh' >> ~/.profile.sh


