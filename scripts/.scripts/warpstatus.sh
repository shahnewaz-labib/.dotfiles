#!/bin/bash

status=`warp-cli status | grep Status | awk '{print $3}' | tr -d '.'`

echo "Warp: ${status:0:1}"
