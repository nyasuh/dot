#!/bin/sh
ScreenWidth=1366
fg="#efefef"
bg="#1A1A1A"
hg="20"
bg_volume="#0BA0AB"
font='ohsnap-12'
WidthPanelInfo=`expr $ScreenWidth / 2 - 100`
WidthPanelClock=200
WidthPanelVolume=100
PosX_info=`expr $ScreenWidth - $WidthPanelInfo - $WidthPanelVolume`
PosX_clock=`expr $ScreenWidth / 2 - $(expr $WidthPanelClock / 2)`
PosX_volume=`expr $ScreenWidth - $WidthPanelVolume`

sleep 0.1 && conky -c ~/.xmonad/bin/conky/info | dzen2 -p -ta r -e 'button3=' -fn 'aqui-12' -fg $fg -bg $bg -h $hg -w $WidthPanelInfo -x $PosX_info &
sleep 0.2 && conky -c ~/.xmonad/bin/conky/music | dzen2 -p -ta c -e 'button3=' -fn 'aqui-10' -fg $fg -bg $bg -h $hg -w 300 -x $PosX_clock &
sleep 0.1 && conky -c ~/.xmonad/bin/conky/clock | dzen2 -p -ta r -e 'button3=' -fn 'aqui-12' -fg $fg -bg $bg_volume -h $hg -w $WidthPanelVolume -x $PosX_volume &
