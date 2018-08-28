#!/bin/bash
# Animated wallpaper changer


WALLPAPERS="$HOME/Pictures/Wallpapers/"
ALIST=( `ls -w1 $WALLPAPERS` )
RANGE=${#ALIST[@]}
let "number = $RANDOM"
let LASTNUM="`cat $WALLPAPERS/.last` + $number"
let "number = $LASTNUM % $RANGE"
echo $number > $WALLPAPERS/.last

DELAY=0.01
QUALITY=0.3
RESIZE=50%

echo $#

if [ $# -ne 1 ]; then
	convert ~/.wallpaper/old.jpg -resize $RESIZE -fill black -blur 10% -fill black -colorize 10% -quality $QUALITY /tmp/transition1.jpg
	convert ~/.wallpaper/old.jpg -resize $RESIZE -fill black -blur 20% -fill black -colorize 20% -quality $QUALITY /tmp/transition2.jpg
	convert ~/.wallpaper/old.jpg -resize $RESIZE -fill black -blur 35% -fill black -colorize 35% -quality $QUALITY /tmp/transition3.jpg
	convert ~/.wallpaper/old.jpg -resize $RESIZE -fill black -blur 50% -fill black -colorize 50% -quality $QUALITY /tmp/transition4.jpg
	convert ~/.wallpaper/old.jpg -resize $RESIZE -fill black -blur 75% -fill black -colorize 75% -quality $QUALITY /tmp/transition5.jpg
	convert ~/.wallpaper/old.jpg -resize $RESIZE -fill black -blur 100% -fill black -colorize 100% -quality $QUALITY /tmp/transition6.jpg

	convert $WALLPAPERS/${ALIST[$number]} -resize $RESIZE -fill black -blur 75% -fill black -colorize 75% -quality $QUALITY /tmp/transition7.jpg
	convert $WALLPAPERS/${ALIST[$number]} -resize $RESIZE -fill black -blur 50% -fill black -colorize 50% -quality $QUALITY /tmp/transition8.jpg
	convert $WALLPAPERS/${ALIST[$number]} -resize $RESIZE -fill black -blur 35% -fill black -colorize 35% -quality $QUALITY /tmp/transition9.jpg
	convert $WALLPAPERS/${ALIST[$number]} -resize $RESIZE -fill black -blur 20% -fill black -colorize 20% -quality $QUALITY /tmp/transition10.jpg
	convert $WALLPAPERS/${ALIST[$number]} -resize $RESIZE -fill black -blur 10% -fill black -colorize 10% -quality $QUALITY /tmp/transition11.jpg

	feh --bg-fill /tmp/transition1.jpg
	sleep $DELAY
	feh --bg-fill /tmp/transition2.jpg
	sleep $DELAY
	feh --bg-fill /tmp/transition3.jpg
	sleep $DELAY
	feh --bg-fill /tmp/transition4.jpg
	sleep $DELAY
	feh --bg-fill /tmp/transition5.jpg
	sleep $DELAY
	feh --bg-fill /tmp/transition6.jpg
	sleep $DELAY

	feh --bg-fill /tmp/transition7.jpg
	sleep $DELAY
	feh --bg-fill /tmp/transition8.jpg
	sleep $DELAY
	feh --bg-fill /tmp/transition9.jpg
	sleep $DELAY
	feh --bg-fill /tmp/transition10.jpg
	sleep $DELAY
	feh --bg-fill /tmp/transition11.jpg
	sleep $DELAY

	rm /tmp/transition*
fi

feh --bg-fill $WALLPAPERS/${ALIST[$number]}

cp $WALLPAPERS/${ALIST[$number]} ~/.wallpaper/old.jpg

