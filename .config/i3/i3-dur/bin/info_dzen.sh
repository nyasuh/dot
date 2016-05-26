#!/bin/bash

FG='#dcdcdc'
BG='#1D2426'
fg_title="#528588"

font1="Inconsolata:size=11"
font_title="Droid Serif:bold:size=10"
icons="Typicons:size=12"
icons2="FontAwesome:size=12"
icons4="FontAwesome:size=10"
icons3="Ionicons:size=12"

 #A simple popup showing system information
 disk=$(df -h / | awk 'NR==2 {total=$2; used=$3; print used" / "total}')
 termfn=$(cat $HOME/.Xdefaults | grep -v ! | awk '/*font/ {print $2}' | sed 's/xft://;s/:pixelsize//;s/=/\ /')
 OS=$(uname -r)
 pid=$(pgrep -x -u $USER $wm)
 HOST=$(uname -n)
 KERNEL=$(uname -r)
 uptime=$(uptime | awk '{print $3}')
 charCount=$(echo ${#uptime})
 MPC=`mpc -f %title%  | head -1`
 MPD=`mpc -f %artist%  | head -1`
 cpu=$(lscpu | grep 'Model name' | awk -F ':' '{print $2}' | cut -c13-37)
 if [[ "$charCount" = "3" ]]
 	then
 	uptime=$(uptime | awk '{print $3}' | sed 's/,/m/')
 elif [[ "$charCount" = "1" ]] || [[ "$charCount" = "2" ]]
 	then
 	uptime=$(uptime | awk '{print $3}' | sed 's/$/m/')
 else
 	uptime=$(uptime | awk '{print $3}' | sed 's/:/h /' | sed 's/,/m/')
 fi


 #UPTIME=$(uptime | sed 's/.* up //' | sed 's/[0-9]* us.*//' | sed 's/ day, /d /'\
  #        | sed 's/ days, /d /' | sed 's/:/h /' | sed 's/ min//'\
   #         |  sed 's/,/m/' | sed 's/  / /')
 PACKAGES=$(pacman -Q | wc -l)
 de=$(wmctrl -m | grep -i name | awk '{print $2}')
 ram_used=$(free -m | grep Mem | awk '{print $3" MB"}')
 ram_total=$(free -m | grep Mem | awk '{print $2" MB"}')
 cpu_user=$(mpstat | grep all | awk '{print $4"%"}')
 cpu_sys=$(mpstat | grep all | awk '{print $6"%"}')
 cpu_idle=$(mpstat | grep all | awk '{print $13"%"}')
 temp=$(cat /sys/devices/virtual/thermal/thermal_zone0/temp)
 let "cpu_temp=$temp/1000"
 hdd_temp=$(hddtemp -n /dev/sda)

gtkrc="$HOME/.gtkrc-2.0"
GtkTheme=$( grep "gtk-theme-name" "$gtkrc" | cut -d\" -f2 )
GtkIcon=$( grep "gtk-icon-theme-name" "$gtkrc" | cut -d\" -f2 )
GtkFont=$( grep "gtk-font-name" "$gtkrc" | cut -d\" -f2 )

(
 echo "
 ^fg($fg_title)^fn($font_title)^p(+25)SYSTEM INFORMATION^p()^fg()" # Fist line goes to title
 echo "   ^fg(#666666)^p(+27)------------------------------------"
 echo "   ^p(+15)^fg(#FFFFFF)^fn($icons2)^fn($font1) Kaze | $HOST "
 echo "   ^p(+15)^fg(#FFFFFF)^fn($icons2)^fn($font1) $uptime"
 echo "   ^p(+15)^fg(#FFFFFF)^fn($icons3)P^fn() $PACKAGES packages"
 echo "   ^fg(#666666)^p(+27)------------------------------------"
 echo "   ^p(+55)^fg(#FFFFFF)^fn($font_title)^fg($fg_title)^bg(#181818) INFO "
 echo "   ^p(+15)^fg(#FFFFFF)^fn($icons2)^fn($font1) WM 		   ^fn($icons4)^fn($font1) $de	"
 echo "   ^p(+15)^fg(#FFFFFF)^fn($icons2)^fn($font1) THEME 	 ^fn($icons4)^fn($font1) $GtkTheme	"
 ##echo "   ^fg(#FFFFFF)^fn($icons2)^fn($font1) ICON    ^fn($icons4)^fn($font1) $GtkIcon	"
 echo "   ^fg(#666666)^p(+27)------------------------------------"
 echo "   ^p(+55)^fg(#FFFFFF)^fn($font_title)^fg($fg_title)^bg(#181818) RAM "
 echo "   ^p(+15)^fg(#FFFFFF)^fn($icons2) ^fn($font1)$ram_used / $ram_total"
 echo "   ^p(+15)^fg(#666666)^p(+27)------------------------------------"
 echo "   ^p(+55)^fg(#FFFFFF)^fn($font_title)^fg($fg_title)^bg(#181818) HDD "
 echo "   ^p(+15)^fg(#FFFFFF)^fn($icons2)^fn($font1) $disk
 "
 echo ""

) | dzen2 -p -x 50 -y 50 -w 200 -bg $BG -fg $FG -l 17 -sa l -ta c -e 'onstart=uncollapse;button1=exit;button3=exit' -fn "Droid Serif-10"
