#!/bin/sh

send_to_next_slash () {
  local current_word=${${=CURRENT_WORD}}  # Get the current word under the cursor
  local cursor_pos=${${=CURSOR_POSITION}}  # Get the cursor position
  local line=${BUFFER}  # Get the current line

  # Find the next occurrence of "/" after the cursor
  local next_slash_pos=$((cursor_pos + $(echo "$line" | grep -bo "$current_word" | awk '{print $1}' | head -n 1)))

  if [[ $next_slash_pos -gt 0 ]]; then
    # Move cursor to the next slash position
    zle -g BEGIN_BINDING=""  # Disable any existing keybindings
    zle . "${next_slash_pos}"  # Move cursor to specific position
    # Insert the current word
    echo "$current_word"
    zle .  # Move cursor one character forward (optional, to avoid overwriting slash)
  fi
}
