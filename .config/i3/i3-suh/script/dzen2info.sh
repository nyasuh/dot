#!/bin/sh
fg="#fcfcfc"
bg="#101010"
conky -c ~/.config/i3/script/conky_dzen2 | dzen2 -p -ta r -e 'button3=' -fn 'ohsnap' -fg "$fg" -bg "$bg" -h 21 -w 966 -y 768 -x 400
