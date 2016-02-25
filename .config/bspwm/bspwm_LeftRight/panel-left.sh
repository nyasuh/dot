#!/bin/bash
#
# panel.sh - panel for my desktop
#

FOLDER="/home/kaze/.config/bspwm"
pkill -f "dzen2 -p -dock -title-name panel"*

statusbar() {
    mpd() {
        cur=$(mpc current)
        echo "^fg(#FFFFFF)^bg(#BB4745) Stay ""^fg(#FFFFFF)^bg(#CB4342) On The" "^fg(#FFFFFF)^bg(#DC2F2D) Left Side""^fg(#ED452D) "
    }

    echo "$(mpd) ^fg(#282522)"
}

while true; do
      echo "$(statusbar)"
      sleep 0.8
done | dzen2 -p -dock -title-name panel -e 'button2=;' -bg '#181818' -fn 'ohsnap-12' -w 400 -h 22 -x 0 -y 0 -ta l -sa c &

