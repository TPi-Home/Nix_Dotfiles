for connector in /sys/class/drm/card*-*; do
    [ -f "$connector/status" ] || continue
    [ "$(cat "$connector/status")" = "connected" ] || continue

    name=$(basename "$connector" | sed 's/^card[0-9]*-//')

    echo "Connector: $name"
    echo "Status: connected"

    if [ -s "$connector/edid" ]; then
        echo "EDID available"
    else
        echo "No EDID available"
    fi

    if [ -r "$connector/modes" ]; then
        echo "Available modes:"
        cat "$connector/modes"
    fi

    echo
done