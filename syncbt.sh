#!/bin/bash

BLUEZCARD=`pactl list cards short | egrep -o bluez_card.*[[:space:]]`
echo $BLUEZCARD
pactl set-card-profile $BLUEZCARD a2dp
pactl set-card-profile $BLUEZCARD hsp
pactl set-card-profile $BLUEZCARD a2dp
