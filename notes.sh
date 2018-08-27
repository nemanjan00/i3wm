#!/bin/bash

ID=$(xprop -root _NET_ACTIVE_WINDOW | cut -d " " -f 5)
FILENAME=$(xprop -id $ID WM_ICON_NAME | cut -d "\"" -f 2)

PAGE_STRING=$(awk -v RS='^$' -F"$FILENAME" '{print $2;}' .local/share/zathura/history | grep page | head -n 1)
PAGE=$(echo -n $LINE_STRING | cut -d "=" -f 2)

termite -e "nvim \"$FILENAME.md\""

