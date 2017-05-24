#!/bin/bash

xrandr --output VGA1 --auto --left-of LVDS1

# default monitor is LVDS1
MONITOR=LVDS1

# functions to switch from LVDS1 to VGA and vice versa
function ActivateVGA {
	echo "Switching to VGA1"
	xrandr --output VGA1 --auto --left-of LVDS1
	MONITOR=VGA1
}
function DeactivateVGA {
	echo "Switching to LVDS1"
	xrandr --output VGA1 --off
	MONITOR=LVDS1
}

# functions to check if VGA is connected and in use
function VGAActive {
	[ $MONITOR = "VGA1" ]
}
function VGAConnected {
	! xrandr | grep "^VGA1" | grep disconnected
}

# actual script
while true
do
	if ! VGAActive && VGAConnected
	then
		ActivateVGA
	fi

	if VGAActive && ! VGAConnected
	then
		DeactivateVGA
	fi

	sleep 1s
done
