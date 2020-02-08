#!/usr/bin/env bash

LIBRARY="$HOME/Library"

function display() {
	books=$(find $LIBRARY | grep '\.epub\|\.pdf')
	books=${books//$LIBRARY/"~"}

	line=$(echo "$books" | rofi -theme themes/appsmenu.rasi -matcher fuzzy -dmenu -i -p "book> ")

	exit_code=$?

	line="${line/\~/$LIBRARY}"

	if [ $exit_code == 0 ]; then
		zathura "${line}"
		echo $line
	fi
}

display

