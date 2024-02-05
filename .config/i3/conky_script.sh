#!/bin/bash

# Check if Conky is running
if pgrep -x "conky" > /dev/null
then
    # Conky is running, so kill it
    pkill -x conky
else
    # Conky is not running, so start it
    conky &
fi

