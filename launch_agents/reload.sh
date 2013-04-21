#!/usr/bin/env bash
for f in *.plist; do
    if test ! -f ~/Library/LaunchAgents/$f; then
        ln -s $PWD/$f ~/Library/LaunchAgents/$f
    else
        launchctl unload ~/Library/LaunchAgents/$f
    fi
    launchctl load ~/Library/LaunchAgents/$f
done
