#!/bin/bash

# pause spotify
playerctl -p spotify pause

TMPBG=/tmp/screen.png
LOCK=$HOME/Pictures/Icons/lock.png
RES=$(xrandr | grep '*' | sed -E "s/[^0-9]*([0-9]+)x([0-9]+).*/\1*\2/")

ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=5:1,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG
i3lock -i $TMPBG

rm $TMPBG

# unpause spotify
# playerctl -p spotify play