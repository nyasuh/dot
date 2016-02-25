#!/bin/bash
#
# panel.sh - panel for my desktop
#

FOLDER="/home/kaze/.config/bspwm"
pkill -f "dzen2 -p -dock -title-name panel"*

statusbar() {
    desk() {
        DESKTOP=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
        case $DESKTOP in
            0)  echo "^fg(#FFFFFF) TERMINAL""^fg(#E0CC22)^ib(1)^p(-70;+15)^r(70x3)^p()^ib()^fg()"  "^fg(#FFFFFF) WEB"   "^fg(#FFFFFF)  NSFW"  "^fg(#FFFFFF)  WORK"
                ;;
            1)  echo "^fg(#FFFFFF) TERMINAL"  "^fg(#FFFFFF)  WEB""^fg(#E0CC22)^ib(1)^p(-30;+15)^r(40x3)^p()^ib()^fg()"   "^fg(#FFFFFF) NSFW"  "^fg(#FFFFFF)  WORK"
                ;;
            2)  echo "^fg(#FFFFFF) TERMINAL"  "^fg(#FFFFFF)  WEB"   "^fg(#FFFFFF)  NSFW""^fg(#E0CC22)^ib(1)^p(-30;+15)^r(40x3)^p()^ib()^fg()"  "^fg(#FFFFFF)  WORK"
                ;;
            3)  echo "^fg(#FFFFFF) TERMINAL"  "^fg(#FFFFFF)  WEB"   "^fg(#FFFFFF)   NSFW"  "^fg(#FFFFFF)   WORK""^fg(#E0CC22)^ib(1)^p(-30;+15)^r(40x3)^p()^ib()^fg()"
                ;;
            *)  echo "error"
        esac
    }
    
    echo "$(desk) ^fg(#282522)"
}

while true; do
      echo "$(statusbar)"
      sleep 0.3
done | dzen2 -p -dock -title-name panel -e 'button2=;' -bg '#181818' -fn 'Termsyn-12' -w 700 -h 22 -x 350 -y 0 -ta c -sa c &

