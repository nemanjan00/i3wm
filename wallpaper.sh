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
	convert ~/.wallpaper/old.jpg -resize $RESIZE -fill black -blur 10% -fill black -colorize 10% -quality $QUALITY ~/.wallpaper/transition1.jpg
	convert ~/.wallpaper/old.jpg -resize $RESIZE -fill black -blur 20% -fill black -colorize 20% -quality $QUALITY ~/.wallpaper/transition2.jpg
	convert ~/.wallpaper/old.jpg -resize $RESIZE -fill black -blur 35% -fill black -colorize 35% -quality $QUALITY ~/.wallpaper/transition3.jpg
	convert ~/.wallpaper/old.jpg -resize $RESIZE -fill black -blur 50% -fill black -colorize 50% -quality $QUALITY ~/.wallpaper/transition4.jpg
	convert ~/.wallpaper/old.jpg -resize $RESIZE -fill black -blur 75% -fill black -colorize 75% -quality $QUALITY ~/.wallpaper/transition5.jpg
	convert ~/.wallpaper/old.jpg -resize $RESIZE -fill black -blur 100% -fill black -colorize 100% -quality $QUALITY ~/.wallpaper/transition6.jpg

	convert $WALLPAPERS/${ALIST[$number]} -resize $RESIZE -fill black -blur 75% -fill black -colorize 75% -quality $QUALITY ~/.wallpaper/transition7.jpg
	convert $WALLPAPERS/${ALIST[$number]} -resize $RESIZE -fill black -blur 50% -fill black -colorize 50% -quality $QUALITY ~/.wallpaper/transition8.jpg
	convert $WALLPAPERS/${ALIST[$number]} -resize $RESIZE -fill black -blur 35% -fill black -colorize 35% -quality $QUALITY ~/.wallpaper/transition9.jpg
	convert $WALLPAPERS/${ALIST[$number]} -resize $RESIZE -fill black -blur 20% -fill black -colorize 20% -quality $QUALITY ~/.wallpaper/transition10.jpg
	convert $WALLPAPERS/${ALIST[$number]} -resize $RESIZE -fill black -blur 10% -fill black -colorize 10% -quality $QUALITY ~/.wallpaper/transition11.jpg

	feh --bg-fill ~/.wallpaper/transition1.jpg
	sleep $DELAY
	feh --bg-fill ~/.wallpaper/transition2.jpg
	sleep $DELAY
	feh --bg-fill ~/.wallpaper/transition3.jpg
	sleep $DELAY
	feh --bg-fill ~/.wallpaper/transition4.jpg
	sleep $DELAY
	feh --bg-fill ~/.wallpaper/transition5.jpg
	sleep $DELAY
	feh --bg-fill ~/.wallpaper/transition6.jpg
	sleep $DELAY

	feh --bg-fill ~/.wallpaper/transition7.jpg
	sleep $DELAY
	feh --bg-fill ~/.wallpaper/transition8.jpg
	sleep $DELAY
	feh --bg-fill ~/.wallpaper/transition9.jpg
	sleep $DELAY
	feh --bg-fill ~/.wallpaper/transition10.jpg
	sleep $DELAY
	feh --bg-fill ~/.wallpaper/transition11.jpg
	sleep $DELAY

	rm ~/.wallpaper/transition*
fi

feh --bg-fill $WALLPAPERS/${ALIST[$number]}

cp $WALLPAPERS/${ALIST[$number]} ~/.wallpaper/old.jpg

