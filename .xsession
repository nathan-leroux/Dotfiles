#!/usr/bin/env bash

# log location
log=$HOME/.config/startup.log

# begin startup and overwrite log
echo local xsession launched at `date +%Y-%m-%d_%H:%M:%S` > $log

# validate i3 config
echo validating i3 config... >> $log
i3 -C >> $log 

# start i3
exec i3 2>> $log 
