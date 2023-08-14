#!/bin/bash

# Define ANSI escape codes for green color
GREEN="\033[0;32m"
RESET="\033[0m"

function enable() {
    id=$(xinput | grep $1 | awk '{print $6}' | sed 's\id=\\')
    echo "Touchpad id:" $id

    tapping_prop=$(xinput --list-props $id | grep "Tapping Enabled" | grep -v "Default" | awk '{print $4}' | sed 's\[^0-9]\\g')
    echo "Tapping Prop number:" $tapping_prop

    xinput set-prop $id $tapping_prop 1 && echo -e "${GREEN}[+] Tapping enabled...${RESET}"

    natural_scrolling_prop=$(xinput --list-props $id | grep "Natural Scrolling" | grep -v "Default" | awk '{print $5}' | sed 's\[^0-9]\\g')
    echo "Natural Scrolling prop number: " $natural_scrolling_prop

    xinput set-prop $id $tapping_prop 1 && echo -e "${GREEN}[+] Natural Scrolling enabled...${RESET}"
}

enable "Touchpad"
