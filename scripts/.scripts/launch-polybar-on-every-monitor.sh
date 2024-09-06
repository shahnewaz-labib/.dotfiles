#!/bin/bash
killall -q polybar

if type "xrandr" >/dev/null 2>&1; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload mybar >/dev/null 2>&1 &
  done
else
  polybar --reload mybar &
fi
