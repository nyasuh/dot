#!/bin/sh
fg="#fcfcfc"
bg="#101010"
conky -c ~/.config/i3/script/conky_dzen | dzen2 -p -ta l -e 'button3=' -fn 'ohsnap' -fg "$fg" -bg "$bg" -h 21 -w 966 -y 768 -x 60
