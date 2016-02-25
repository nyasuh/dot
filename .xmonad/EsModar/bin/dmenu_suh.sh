#!/bin/sh
terminal='urxvt -e'
menu_list="»» File\\n»» Wall\n»» Web\n»» Gimp\n»» Music\n»» Htop\n»» Shot\n»» Logout\n»» Reboot\n»» Shutdown"
Dmenu="dmenu -p '' -i -b -h 24 -l 12 -w 100 -dim 0.0 -x 100 -y 380 -fn 'ohsnap' -i -nb '#231E1E' -sb '#317A6F' -nf '#E5CBCB' -sf '#FFFFFF'"

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
	scrot 'asuh.png' -e 'mv $f ~/Pictures/' && notify-send 'Hahaha !' ;;
   *Logout | ";"i | i";") 
    pkill xmonad & ;;
   *Reboot)
   shutdown -r now & ;;
  *Shutdown)
   shutdown -h now & ;;

  
    
esac
