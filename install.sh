#!/bin/bash

# Define the directory where install scripts are located
install_dir="install_scripts"

# Check if arguments are provided
if [ $# -gt 0 ]; then
    # If arguments are provided, loop through them
    for arg in "$@"; do
        # Find and execute scripts containing the argument in their names
        scripts_to_run=$(find "$install_dir" -type f -name "*$arg*" -print)
        for script in $scripts_to_run; do
            echo "Running script: $script"
            "./$script"
        done
    done
else
    # If no arguments provided, run all scripts in the install directory
    for script in "$install_dir"/*; do
        echo "Running script: $script"
        bash "$script"
    done
fi

