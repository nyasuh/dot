#!/bin/sh

# Define your battery device. Look up in '/sys/class/power_supply/' for a directory named 'BAT0' ( it also can be 'BAT1 or something else )
device='BAT0'
battery="$(cat /sys/class/power_supply/$device/capacity)%"

# Volume Status for alsa users
volume="$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')"

# Define your preferred terminal
terminal='urxvt -e'

# How many spaces do you want before the battery status ?
spaces=50

# Automating the number of spaces
function auto_space
{
for ((i = 0; i <= $spaces; i++)); do
  printf ' '
done
}

# Menu Order.
menu_list="Vim\nWeb\nTerm\nEmacs\nMusic\nHtop\nRanger\nScreenshot\n$(eval auto_space)Vol: $volume"

# Dmenu Preferences
Dmenu="/usr/bin/dmenu -p 'Nami@$(hostname)' -fn 'ohsnap' -i -y 752 -x 350 -w 780 -nb '#101010' -sb '#E06179' -nf '#FFFFFF' -sf '#FFFFFF'"

cmd=$(echo -e "$menu_list" | eval $Dmenu)

case $cmd in
  Vim)
    $terminal vim ;;
  Web)
    google-chrome-stable ;;
  Ranger)
    $terminal ranger ;;
  Htop)
    $terminal htop ;;
  Term)
    $terminal zsh ;;
  Emacs)
    emacs ;;
  Music)
    $terminal ncmpcpp ;;
  Screenshot)
    scrot '%F--%I:%M:%S:%p--$wx$h--scrot.png' -e 'mv $f ~/.scrots/' && notify-send 'Scrot Saved !' ;;
esac
exit 0
