#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Define the output file
OUTPUT_FILE="clock_output.txt"

# Create or clear the output file
echo -e "${YELLOW}Timestamp Log${NC}" > "$OUTPUT_FILE"

# Prompt for alarm time
read -p "Set an alarm (HH:MM format, 24-hour): " ALARM_TIME

# Infinite loop to display time
while true; do
    # Get the current timestamp and time
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    DATE=$(date +"%A, %B %d, %Y")
    CURRENT_TIME=$(date +"%H:%M")

    # Print the timestamp and date with colors
    echo -e "${GREEN}Date: ${NC}${DATE}"
    echo -e "${BLUE}Time: ${NC}${TIMESTAMP}"

    # Append the timestamp to the output file
    echo "$TIMESTAMP" >> "$OUTPUT_FILE"

    # Check if it's time for the alarm
    if [ "$CURRENT_TIME" == "$ALARM_TIME" ]; then
        echo -e "${RED}ALARM! It's $ALARM_TIME!${NC}"
        # Optional: add a sound notification (uncomment to enable)
        # paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga
        break # Exit the loop after the alarm goes off
    fi

    # Sleep for 1 second
    sleep 1

    # Clear the screen for the next update
    clear
done
