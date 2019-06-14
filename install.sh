#!/bin/sh

echo "Deboni Dots install script - TODO"
sudo pacman -S calcurse pulseaudio volumeicon networkmanager-applet cbaticon comptom sxhkd
nitrogen redshift

cp .config ../
cp .xinitrc ../
