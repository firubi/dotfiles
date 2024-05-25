#!/bin/bash

# Function to get the volume percentage
get_volume() {
    volume=$(pamixer --get-volume)
    echo "$volume%"
}

# Function to check if audio is muted
is_muted() {
    muted=$(pamixer --get-mute)
    if [ "$muted" = true ]; then
        echo "Muted"
    else
        echo "Unmuted"
    fi
}

# Main function
main() {
    volume=$(get_volume)
    muted=$(is_muted)

    if [ "$muted" = "Muted" ]; then
        echo "%{F#FF0000}%{F-} $volume"
    else
        echo "%{F#F0C674}%{F-} $volume"
    fi
}

# Call the main function
main
