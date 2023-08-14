#!/bin/bash

# Define ANSI escape codes for green color
GREEN="\033[0;32m"
RESET="\033[0m"

# Print text in green color
echo -e "${GREEN}This text is in green color${RESET}"

# Reset color back to default
echo "This text is in default color"

