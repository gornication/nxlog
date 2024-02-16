#!/bin/bash

################################################################################
# Script Name: system_journal.sh
# Description: Follows and prints the system journal on Linux.
# Author: Gorenkov Oleg
# Date: 16.02.2024
################################################################################

# Function to clean up temporary files on script exit
cleanup() {
    if [[ -f "$TMP_FILE" ]]; then
        rm -f "$TMP_FILE"
    fi
}

# Function to handle errors
handle_error() {
    echo "Error: $1" >&2
    exit 1
}

# Define temporary file for storing last read log entry
TMP_FILE=$(mktemp)

# Set up cleanup trap
trap 'cleanup' EXIT

# Check if journalctl command is available
if ! command -v journalctl &> /dev/null; then
    handle_error "journalctl command not found. Unable to access system journal."
fi

# Check if the script is running as root
if [[ $(id -u) -eq 0 ]]; then
    handle_error "Script must not be run as root."
fi

# Follow the system journal and print logs to STDOUT in JSON format
journalctl --output=json --follow --after-cursor=$(cat "$TMP_FILE") || handle_error "Failed to follow system journal."

# End of script
