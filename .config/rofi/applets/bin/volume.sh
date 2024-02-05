#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Volume

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

get_info() {
# Volume Info
mixer="`amixer info Master | grep 'Mixer name' | cut -d':' -f2 | tr -d \',' '`"
speaker="`amixer get Master | tail -n1 | awk -F ' ' '{print $5}' | tr -d '[]'`"
mic="`amixer get Capture | tail -n1 | awk -F ' ' '{print $5}' | tr -d '[]'`"
if [[ "`amixer get Master | tail -n1 | awk -F ' ' '{print $6}' | tr -d '[]'`" == "on" ]] then
  mute_speaker=
else
  mute_speaker=
fi

active=""
urgent=""

prompt="Volume"


# Theme Elements
mesg="$mixer - Speaker: $speaker $mute_speaker , Mic: $mic "
}
list_col='1'
list_row='1'
win_width='400px'


# Options
layout=`cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2`
if [[ "$layout" == 'NO' ]]; then
	option_5=" Settings"
else
	option_5=""
fi

# Rofi CMD
rofi_cmd() {
  while true; do
    get_info
    rofi -normal-window -theme-str "window {width: $win_width;}" \
      -theme-str "listview {columns: $list_col; lines: $list_row;}" \
      -theme-str 'textbox-prompt-colon {str: "";}' \
      -dmenu \
      -p "$prompt" \
      -mesg "$mesg" \
      ${active} ${urgent} \
      -markup-rows \
      -theme ${theme}
  done
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_5" | rofi_cmd
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt5' ]]; then
		pavucontrol
	fi
}

# Actions
chosen="$(run_rofi)"
# case ${chosen} in
#     $option_5)
# 		run_cmd --opt5
#         ;;
# esac

