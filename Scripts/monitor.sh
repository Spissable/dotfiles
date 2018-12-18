#!/bin/bash

#date >> /home/lukas/Tmp/udev.log
export DISPLAY=:0
export XAUTHORITY=/run/user/1000/gdm/Xauthority
X_USER=$(w -h -s | grep ":[0-9]\W" | head -1 | awk '{print $1}')

# Get out of town if something errors
set -e

DP2_STATUS=`cat /sys/class/drm/card0/card0-DP-2/status`
DP1_STATUS=`cat /sys/class/drm/card0/card0-DP-1/status`

/bin/su $X_USER -c 'gsettings set org.gnome.desktop.interface scaling-factor 1'

if [ "connected" == "$DP2_STATUS" ]; then  
    /bin/su $X_USER -c '/usr/bin/xrandr --output eDP-1 --off'
    /bin/su $X_USER -c '/usr/bin/xrandr --output DP-2 --auto'
    /bin/su $X_USER -c '/usr/bin/xrandr --output DP-2 --auto'
    /bin/su $X_USER -c '/usr/bin/gsettings set org.gnome.desktop.interface text-scaling-factor 1.5'
    /bin/su $X_USER -c 'killall polybar'
    /bin/su $X_USER -c '/home/lukas/.config/polybar/polybar.sh hdpi_bar'
    /bin/su $X_USER -c '/usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "DP-2 plugged in"'
elif [ "connected" == "$DP1_STATUS" ]; then  
    /bin/su $X_USER -c '/usr/bin/xrandr --output eDP-1 --off'
    /bin/su $X_USER -c '/usr/bin/xrandr --output DP-1 --auto'
    /bin/su $X_USER -c '/usr/bin/xrandr --output DP-1 --auto'
    /bin/su $X_USER -c '/usr/bin/gsettings set org.gnome.desktop.interface text-scaling-factor 1.5'
    /bin/su $X_USER -c 'killall polybar'
    /bin/su $X_USER -c '/home/lukas/.config/polybar/polybar.sh hdpi_bar'
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "DP-1 plugged in"
else  
    /bin/su $X_USER -c '/usr/bin/xrandr --output DP-1 --off'
    /bin/su $X_USER -c '/usr/bin/xrandr --output DP-2 --off'
    /bin/su $X_USER -c '/usr/bin/xrandr --output eDP-1 --auto'
    /bin/su $X_USER -c '/usr/bin/gsettings set org.gnome.desktop.interface text-scaling-factor 1.0'
    /bin/su $X_USER -c 'killall polybar'
    /bin/su $X_USER -c '/home/lukas/.config/polybar/polybar.sh full-hd_bar'
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "External monitor disconnected"    
    exit
fi
