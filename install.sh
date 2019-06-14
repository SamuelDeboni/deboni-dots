#!/bin/sh

echo "Deboni Dots install script - TODO"
sudo pacman -S calcurse pulseaudio volumeicon network-manager-applet cbatticon compton sxhkd nitrogen redshift

cp .config ../
cp .xinitrc ../
