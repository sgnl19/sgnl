#!/bin/bash

DATE=$(date '+%s')
touch /tmp/${DATE}

## monitor setup
~/.screenlayout/2-mon-hdmi.sh

#if ! pgrep "syndaemon" > /dev/null
#then
#    syndaemon -i 1 -K -d
#	~/.screenlayout/3-mon.sh
#fi
