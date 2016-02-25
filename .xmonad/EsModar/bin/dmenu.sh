#!/bin/sh
font="ohsnap-8"
widthscreen="1368"
heightscreen="768"
fg="#0BA0AB"
bg="#1A1A1A"
dmenu_run -b -h 24 -l 9 -fn $font -x `expr $widthscreen / 2 - 225` -y `expr $heightscreen / 2 - $(expr 24 \* 9 / 2)` -w 450 -nb $bg -sb $fg -dim 0.50
