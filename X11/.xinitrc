xrdb -merge ~/.config/X11/.Xresources
#setxkbmap -option ctrl:nocaps
setxkbmap -option 'caps:ctrl_modifier'; xcape -e 'Caps_Lock=Escape' &
urxvtd -o -q -f
udiskie &
exec i3
