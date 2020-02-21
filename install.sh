#!/bin/bash
set -e
cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

[[ -f submodules/iterm-notify/notify.py ]] || echo Missing iterm-notify
[[ -d ~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch ]] || mkdir -p ~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch
[[ -f ~/.iterm-notify-init.sh ]] || cp submodules/iterm-notify/init.sh ~/.iterm-notify-init.sh
[[ -f ~/.iterm-notify-identity ]] || openssl rand -base64 32|head -n1 > ~/.iterm-notify-identity && chmod 0600 ~/.iterm-notify-identity
#source submodules/iterm-notify/init.sh


grep -q iterm-notify-init ~/.profile.sh || echo 'source ~/.iterm-notify-init.sh' >> ~/.profile.sh


