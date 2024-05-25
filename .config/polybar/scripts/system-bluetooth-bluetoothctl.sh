#!/bin/sh

bluetooth_print() {
    bluetoothctl | grep --line-buffered 'Device\|#' | while read -r REPLY; do
        if bluetoothctl show | grep -q "Powered: no"; then
            printf ' OFF\n'
        else
            connected_devices=$(bluetoothctl devices Paired | grep Device | cut -d ' ' -f 2 | while read -r device; do
                if bluetoothctl info "$device" | grep -q "Connected: yes"; then
                    bluetoothctl info "$device" | grep "Alias" | cut -d ' ' -f 2-
                fi
            done | paste -sd, -)

            if [ -n "$connected_devices" ]; then
                printf " %s\n" "$connected_devices"
            else
                printf ' ON\n'
            fi
        fi
    done
}

bluetooth_toggle() {
    if bluetoothctl show | grep -q "Powered: no"; then
        bluetoothctl power on >> /dev/null && sleep 1
        bluetoothctl devices Paired | grep Device | cut -d ' ' -f 2 | xargs -I{} bluetoothctl connect {} >> /dev/null
    else
        bluetoothctl devices Paired | grep Device | cut -d ' ' -f 2 | xargs -I{} bluetoothctl disconnect {} >> /dev/null
        bluetoothctl power off >> /dev/null
    fi
}

case "$1" in
    --toggle)
        bluetooth_toggle
        ;;
    *)
        bluetooth_print
        ;;
esac
