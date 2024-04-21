xrdb -merge ~/.config/X11/.Xresources
setxkbmap -option ctrl:nocaps
urxvtd -o -q -f
exec i3
