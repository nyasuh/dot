#!/bin/bash

# Characters and colors for vertical and horizontal lines
: ${char_v:='|'}            ${char_h:='-'}
: ${color_v:='\e[32;1m'}    ${color_h:='\e[31;1m'}

# Sleep delays
: ${sleep_v:=0.01}          ${sleep_h:=0.01}
: ${sleep_end:=5}

: ${eval_h:="$1"}           Get evaluation code from '$1'
: ${eval_h:='(((x+y)%2))'}  , or set to a default pattern
: ${show_eval_h:=no}        "yes" to print out evaluation code

W=$(tput cols)              H=$(tput lines)


draw_v() {
  local line y
  printf -v line '%*s' $W ; line=${line// /$char_v}
  for ((y=1; y<=H; y++)); do
    echo -ne "\e[${y};1H${color_v}${line}"
    sleep $sleep_v
  done
}


draw_h() {
  local x y
  for ((x=1; x<=W; x++)); do
    for ((y=1; y<=H; y++)); do
      eval "$eval_h" && echo -ne "\e[${y};${x}H${color_h}${char_h}"
    done
    sleep $sleep_h
  done
}


main() {
  clear
  draw_v
  draw_h
  [[ $show_eval_h == yes ]] && echo -ne "\e[$H;1H\e[0m${eval_h:0:$W}"
  sleep $sleep_end
}


main
