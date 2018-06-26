#!/bin/bash

DATE=$(date '+%s')
touch /tmp/${DATE}

## monitor setup
~/.screenlayout/1-mon.sh

#if ! pgrep "syndaemon" > /dev/null
#then
#    syndaemon -i 1 -K -d
#	~/.screenlayout/3-mon.sh
#fi
