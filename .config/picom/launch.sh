#!/bin/bash

# close all current picom processes
killall -q picom

# launch picom
picom --config $HOME/.config/picom/picom.conf
