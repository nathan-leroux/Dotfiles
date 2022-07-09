#!/bin/bash

# maybe dont be a monyet and delete this one yeah?

# check for 3 arguments
if [ $# -ne 3 ]; then
	echo "usage lights.sh <type> <direction> <amount>"
	exit 1;
fi

# check for lights or keys
if [ $1 == "screen" ]; then
	medium="--device=intel_backlight"
elif [ $1 == "keys" ]; then
	medium="--device=smc::kbd_backlight"
else
	echo "invalid value for <type>, 'screen' or 'keys'"
	exit 1;
fi

# check for increase or decrease
if [ $2 == "up" ]; then
	amount=+${3}%
elif [ $2 == "down" ]; then
	amount=${3}%-
else
	echo "invalid value for <direction>, 'up' or 'down'"
	exit 1;
fi

# adjust
brightnessctl -q ${medium} set ${amount}

# log output
brightnessctl -P ${medum} get
