#!/bin/sh
terminal='urxvt -e'
font1='-ohsnap' 
menu_list="»» File\\n»» Wall\n»» Web\n»» Gimp\n»» Music\n»» Shot\n------------\n»» Logout\n»» Reboot\n»» Shutdown"

Dmenu="dmenu -p '' -i -b -h 24 -l 12 -w 100 -dim 0.0 -x 720 -y 320 -i -fn 'ohsnap'  -nb '#FFFFFF' -sb '#FF3038' -nf '#232323' -sf '#212121'"

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
