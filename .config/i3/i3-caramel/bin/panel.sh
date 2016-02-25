#!/bin/sh
ScreenWidth=1366
fg="#efefef"
bg="#353535"
hg="20"
bg_volume="#14BAC5"
font='ohsnap-12'
WidthInfo=`expr $ScreenWidth / 2 - 100`
WidthVolume=100
X_info=`expr $ScreenWidth - $WidthInfo - $WidthVolume`
X_volume=`expr $ScreenWidth - $WidthVolume`

conky -c /home/kaze/.config/i3/bin/conky/info | dzen2 -p -ta r -e 'button3=' -fn 'glispbold-10' -fg $fg -bg $bg -h $hg -w $WidthInfo -x $X_info &
conky -c /home/kaze/.config/i3/bin/conky/info2 | dzen2 -p -ta r -e 'button3=' -fn 'glispbold-9' -fg $fg -bg $bg_volume -h $hg -w $WidthVolume -x $X_volume &
