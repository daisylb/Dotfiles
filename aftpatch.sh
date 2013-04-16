#!/usr/bin/env bash
cd /Applications/Android\ File\ Transfer.app/Contents/Resources
mv Android\ File\ Transfer\ Agent.app Android\ File\ Transfer\ Agent\ DISABLED.app
if test -e "~/Library/Application Support/Google/Android File Transfer Agent.app"
    cd "~/Library/Application Support/Google/"
    mv Android\ File\ Transfer\ Agent.app Android\ File\ Transfer\ Agent\ DISABLED.app
fi
