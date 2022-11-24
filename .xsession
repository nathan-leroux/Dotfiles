#!/usr/bin/env bash

# log location
log=$HOME/.config/startup.log

# begin startup and overwrite log
echo local xsession launched at `date +%Y-%m-%d_%H:%M:%S` > $log

# validate i3 config
echo validating i3 config... >> $log
i3 -C >> $log 

# start polybar
#echo polybar launched... >> $log
#$HOME/.config/polybar/launch.sh 2>> $log &

# start picom
#$HOME/.config/picom/launch.sh &

# load wallpaper
echo loading wallpaper... >> $log
feh --bg-fill $HOME/Pictures/cyberpunk.png 2>> $log

# start i3
exec i3 2>> $log 
