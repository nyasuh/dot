#!/bin/bash
#
# panel.sh - panel for my desktop
#

FOLDER="/home/kaze/.config/bspwm"
pkill -f "dzen2 -p -dock -title-name panel"*

statusbar() {    
    clock() {
        time=$(date "+%I:%M %P %A-%B")
        echo "^fg(#FFFFFF)^bg(#3B9BA1) Stay ""^fg(#FFFFFF)^bg(#42B2B8) On The" "^fg(#FFFFFF)^bg(#39CDD5) Right Side ""^fg(#ED452D) "
    }
#    vol() {
#        volume=$(amixer get Master | egrep -o "[0-9]+%" | head -1)
#        echo "^fg(#ED452D)|""^bg()^fg(#FFFFFF) ^i($FOLDER/vol.xbm) ^bg()^fg(#FFFFFF)$volume"
#    }

    echo "$(clock)"
}

while true; do
      echo "$(statusbar)"
      sleep 0.8
done | dzen2 -p -dock -title-name panel -e 'button2=;' -bg '#181818' -fn 'ohsnap-12' -w 400 -h 22 -x 1000 -y 0 -ta r -sa c &

