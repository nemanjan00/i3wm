#!/bin/bash

mkfifo /tmp/mpd.fifo
while :; do yes $'\n' |  nc -lu 127.0.0.1 5555 > /tmp/mpd.fifo ; done

