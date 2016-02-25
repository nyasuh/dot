#!/bin/bash
#
# panel.sh - panel for my desktop
#

FOLDER="/home/kaze/.config/bspwm"
pkill -f "dzen2 -p -dock -title-name panel"*

statusbar() {
    mpd() {
        cur=$(mpc current)
        echo "^fg(#ED452D)|""^bg()^fg(#FFFFFF)  ^i($FOLDER/note.xbm)  ^bg()^fg(#FFFFFF)$cur" "^fg(#ED452D)|"
    }

    echo "$(mpd) ^fg(#282522)"
}

while true; do
      echo "$(statusbar)"
      sleep 0.8
done | dzen2 -p -dock -title-name panel -e 'button2=;' -bg '#101010' -fn 'ohsnap-12' -w 1768 -h 20 -x 0 -y 768 -ta c -sa c &

