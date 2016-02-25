#!/bin/sh

# Define your battery device. Look up in '/sys/class/power_supply/' for a directory named 'BAT0' ( it also can be 'BAT1 or something else )
#device='BAT0'
#battery="$(cat /sys/class/power_supply/$device/capacity)%"

# Volume Status for alsa users
#volume="$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')"



# How many spaces do you want before the battery status ?
#spaces=50

# Define your preferred terminal
terminal='urxvt -e'
 

# Menu Order.
menu_list="»» File\\n»» Wall\n»» Web\n»» Gimp\n»» Music\n»» Shot\n------------\n»» Logout\n»» Reboot\n»» Shutdown"

# Dmenu Preferences
Dmenu="dmenu -p '' -i -b -h 24 -l 12 -w 100 -dim 0.0 -x 720 -y 320 -i -fn 'ohsnap','lemon'  -nb '#212121' -sb '#36887B' -nf '#E5CBCB' -sf '#FFFFFF'"

asuh=$(echo -e "$menu_list" | eval $Dmenu)



case $asuh in
  *File)
    thunar ;;
  *Wall)
    nitrogen ;;
  *Web)
    firefox ;;
  *Ranger)
    $terminal ranger ;;
  *Htop)
    $terminal htop ;;
  *Term)
    urxvt ;;
  *Gimp)
    gimp ;;
  *Music)
    $terminal ncmpcpp ;; 
  *Shot)
	scrot 'asuh.png' -e 'mv $f ~/Pictures/' && notify-send 'Scrot Saved !' ;;
   *Logout | ";"i | i";") 
    pkill i3 & ;;
   *Reboot)
   shutdown -r now & ;;
  *Shutdown)
   shutdown -h now & ;;

  
    
esac
