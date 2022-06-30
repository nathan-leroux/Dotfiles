#!/usr/bin/env bash

# kill already running bar instances
killall -q polybar

# Launch bar
polybar bar120 & disown


