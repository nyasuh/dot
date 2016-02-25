#!/bin/bash
Nama1="Term"
Exec1="urxvt"
Nama2="File Manager"
Exec2="thunar"
Nama3="Image Editor"
Exec3="gimp"
Nama4="Text Editor"
Exec4="geany"
Nama5="Change Wallpaper"
Exec5="nitrogen"
Nama6="Power Menu"
Exec6="oblogout"
Y=768
Font="ohsnap"
Title=""
BG=#FF172D
FG=#fcfcfc
IconTitle="/home/kaze/.xmonad/icons/menu.xbm"
(echo "^ro(0)^ib(1)  ^i($IconTitle) $Title" ;echo -e "\
\n^ca(1,$Exec1)^r(0)  $Nama1 ^pa(117)^r(0)^ca()\
\n^ca(1,$Exec2)^r(0)  $Nama2 ^pa(117)^r(0)^ca()\
\n^ca(1,$Exec3)^r(0)  $Nama3 ^pa(117)^r(0)^ca()\
\n^ca(1,$Exec4)^r(0)  $Nama4 ^pa(117)^r(0)^ca()\
\n^ca(1,$Exec5)^r(0)  $Nama5 ^pa(117)^r(0)^ca()\
\n^ca(1,$Exec6)^r(0)  $Nama6 ^pa(117)^r(0)^ca()")\
| dzen2 -y "$Y" -fn "$Font" -bg "$BG" -fg "$FG" -l 6 -tw 60 -ta l -w 120 -h 21 -m -p -e 'entertitle=;enterslave=grabkeys;leaveslave=collapse,ungrabkeys;button1=uncollapse,grabkeys;button2=togglestick;button3=;button4=scrollup;button5=scrolldown;key_Escape=ungrabkeys'
