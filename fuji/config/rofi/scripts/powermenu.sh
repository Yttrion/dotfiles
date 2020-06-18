#!/usr/bin/env bash

rofi_command="rofi -theme .config/rofi/powermenu-theme.rasi"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown="  "
reboot="  "
logout="  "

# Variable passed to rofi
options="$shutdown\n$logout\n$reboot"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 1)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $logout)
        openbox --exit
        ;;
esac

