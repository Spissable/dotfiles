#!/bin/bash

# CLEANUP

# home directory
ln -sfn home/.bashrc ~/.bashrc
ln -sfn home/.zshrc ~/.zshrc
ln -sfn home/.Xresources ~/.Xresources
ln -sfn home/.gitignore ~/.gitignore
ln -sfn home/.gitconfig ~/.gitconfig

# config directory
ln -sfn .config/i3/config ~/.config/i3/config
ln -sfn .config/polybar/config ~/.config/polybar/config
ln -sfn .config/polybar/launch.sh ~/.config/polybar/launch.sh
ln -sfn .config/polybar/spotify.py ~/.config/polybar/spotify.py
ln -sfn .config/rofi/config ~/.config/rofi/config

# scripts directory
ln -sfn Scripts/lock.sh ~/Scripts/lock.sh
ln -sfn Scripts/monitor.sh ~/Scripts/monitor.sh
