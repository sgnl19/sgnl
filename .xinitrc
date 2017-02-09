#!/bin/bash

DATE=$(date '+%s')
touch /tmp/${DATE}

## monitor setup
# ~/.screenlayout/laptop-left-3-screens.sh

if ! pgrep "syndaemon" > /dev/null
then
    syndaemon -i 1 -K -d
	~/.screenlayout/laptop-left-3-screens.sh
fi
