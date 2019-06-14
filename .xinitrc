#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
   xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap -model abnt2 -layout br -variant abnt2
xmodmap -e 'clear Lock' #ensures you're not stuck in CAPS on mode
xmodmap -e 'keycode 0x42=Escape' #remaps the keyboard so CAPS LOCK=ESC

while true; do
    # next calendar apointment
    cal=$(calcurse -n | cut -d$'\n' -f2 |cut -d' ' -f4-)

    # current time 
    t=$(date | cut -d" " -f2-6)
    xsetroot -name "$cal | $t"
 
    sleep 5s
done &

# Auto start apps
#trayer --expand true --widthtype request --transparent true --alpha 255 --edge bottom --align right &
pulseaudio &
nm-applet &
volumeicon &
cbatticon &
compton &
sxhkd &
xrandr --output VGA1 --auto --left-of LVDS1 &
nitrogen --restore &
redshift-gtk &
exec dwm 

#exec i3
