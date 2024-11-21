#!/bin/bash

# Get the active window ID
ACTIVE_WINDOW=$(xdotool getactivewindow)

# Check if the window is Zathura
if xprop -id "$ACTIVE_WINDOW" | grep -q "Zathura"; then
    # Get the current opacity value
    CURRENT_OPACITY=$(xprop -id "$ACTIVE_WINDOW" _NET_WM_WINDOW_OPACITY | awk '{print $3}')

    # Toggle opacity
    if [ "$CURRENT_OPACITY" = "3435973836" ]; then
        # Set to fully opaque
        xprop -id "$ACTIVE_WINDOW" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY 4294967295
    else
        # Set to semi-transparent (80%)
        xprop -id "$ACTIVE_WINDOW" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY 3435973836
    fi
fi
