#!/bin/bash
while true; do
	ev=`inotifywait -e create -e moved_to ~/Mail/*/*/new 2> /dev/null`
	pa=${ev/ */}
	f="$pa/${ev/* /}"
	bo=${pa/\/new/}
	bo=${bo/*Mail\//}
	notify-send -t 12000 -i '/usr/share/icons/oxygen/32x32/status/mail-unread-new.png' "New mail in $bo" "`grep -m 1 ^From: $f`\n`grep -m 1 ^Subject: $f`"
done

