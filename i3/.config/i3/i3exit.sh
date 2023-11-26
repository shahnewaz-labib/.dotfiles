#!/bin/bash

# Check if parameter is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <action>"
  exit 1
fi

# Check if the parameter is "lock"
if [ "$1" = "lock" ]; then
  # Run betterlockscreen -l
  betterlockscreen -l
# else
#   echo "Invalid action. Please provide 'lock' as the parameter."
#   exit 1
fi


if [ "$1" = "shutdown" ]; then
    shutdown now
# else
#   echo "Invalid action. Please provide 'lock' as the parameter."
#   exit 1
fi
