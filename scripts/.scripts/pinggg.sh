#!/bin/bash

ip="1.1.1.1"
latency=$(ping -c 1 $ip 2>&1 | grep "time=" | awk '{print $7}' | cut -d '=' -f 2)

if [ -n "$latency" ]; then
    echo "$latency ms"
else
    echo "no internet"
fi

