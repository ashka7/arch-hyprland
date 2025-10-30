#!/usr/bin/env bash

SINK="@DEFAULT_SINK@"
was_playing=false

while true; do
    mute_state=$(pactl get-sink-mute "$SINK" | awk '{print $2}')
    status=$(playerctl status 2>/dev/null)

    if [[ "$mute_state" == "yes" && "$status" == "Playing" ]]; then
        playerctl pause
        was_playing=true
    elif [[ "$mute_state" == "no" && "$was_playing" == true ]]; then
        playerctl play
        was_playing=false
    fi

    sleep 1
done

