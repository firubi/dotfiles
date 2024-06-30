#!/bin/bash

entries="⇠ Logout\n⭮ Reboot\n⏻ Shutdown"

selected=$(echo -e $entries|wofi --width 250 --height 210 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  logout)
    hyprctl dispatch exit;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
