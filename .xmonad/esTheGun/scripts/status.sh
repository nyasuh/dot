#!/bin/bash

SLEEP=2
ICONPATH="~/.icons/stlarch"
COLOR_ICON="#BA2020"
CRIT_COLOR="#ff2c4a"
DZEN_FG="#0f0f0f"
DZEN_BG="#101010"
HEIGHT=21
WIDTH=1368
X=450
Y=0
BAR_FG="#BA2020"
BAR_BG="#808080"
BAR_H=7
BAR_W=40
FONT="-*-ohsnap-medium-r-*-*-9-*-*-*-*-*-iso10646-*"
VUP="amixer -c0 -q set Master 2dB+"
VDOWN="amixer -c0 -q set Master 2dB-"
EVENT="button3=exit;button1=exec:$VUP;button2=exec:$VDOWN;"
DZEN="dzen2 -x $X -y $Y -w $WIDTH -h $HEIGHT -fn $FONT -ta right -bg $DZEN_BG -fg $DZEN_FG"

conky -c ~/.xmonad/scripts/status | dzen2 -e 'button3=' -x $X -y $Y -w $WIDTH -h $HEIGHT -fn $FONT -ta right -bg $DZEN_BG -fg $DZEN_FG
