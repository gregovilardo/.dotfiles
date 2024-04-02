#!/bin/bash

output=$(wl-gammarelay-rs run)
echo $output > "$HOME/.config/sway/out"
