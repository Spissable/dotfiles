#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/lukas/.Xauthority
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
X_USER=lukas

# Get out of town if something errors
set -e

DP2_STATUS=`cat /sys/class/drm/card0/card0-DP-2/status`
DP1_STATUS=`cat /sys/class/drm/card0/card0-DP-1/status`

if [ "connected" == "$DP2_STATUS" ]; then  
    /bin/su $X_USER -c '/usr/bin/xrandr --output eDP1 --off'
    /bin/su $X_USER -c '/usr/bin/xrandr --output DP2 --auto'
    /bin/su $X_USER -c '/usr/bin/xrandr --output DP2 --auto'
    /bin/su $X_USER -c '/usr/bin/gsettings set org.gnome.desktop.interface text-scaling-factor 1.4'
    /bin/su $X_USER -c 'killall -q polybar'
    /bin/su $X_USER -c 'polybar --config=/home/lukas/.config/polybar/config hdpi_bar'
    /bin/su $X_USER -c '/usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "DP2 plugged in"'
elif [ "connected" == "$DP1_STATUS" ]; then  
    /bin/su $X_USER -c '/usr/bin/xrandr --output eDP1 --off'
    /bin/su $X_USER -c '/usr/bin/xrandr --output DP1 --auto'
    /bin/su $X_USER -c '/usr/bin/xrandr --output DP1 --auto'
    /bin/su $X_USER -c '/usr/bin/gsettings set org.gnome.desktop.interface text-scaling-factor 1.4'
    /bin/su $X_USER -c 'killall -q polybar'
    /bin/su $X_USER -c 'polybar --config=/home/lukas/.config/polybar/config hdpi_bar'
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "DP1 plugged in"
else  
    /bin/su $X_USER -c '/usr/bin/xrandr --output DP1 --off'
    /bin/su $X_USER -c '/usr/bin/xrandr --output DP2 --off'
    /bin/su $X_USER -c '/usr/bin/xrandr --output eDP1 --auto'
    /bin/su $X_USER -c '/usr/bin/gsettings set org.gnome.desktop.interface text-scaling-factor 1.0'
    /bin/su $X_USER -c 'killall -q polybar'
    /bin/su $X_USER -c 'polybar --config=/home/lukas/.config/polybar/config full-hd_bar'
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "External monitor disconnected"    
    exit
fi
