while :
do
	bash ~/.i3/sync.sh
	sleep $((10 * 60))
	bash ~/.i3/wallpaper.sh
done
