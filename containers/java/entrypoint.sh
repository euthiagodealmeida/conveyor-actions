#!/bin/sh

# Source SDKMAN
if [ -f "/root/.sdkman/bin/sdkman-init.sh" ]; then
  . /root/.sdkman/bin/sdkman-init.sh
  echo "SDKMAN sourced successfully"
fi

# Print arguments received
printf 'Received %d args:' "$#"
printf " '%s'" "$@"
printf '\n'

# Execute the command with proper shell handling
if [ $# -gt 1 ] && [ "$1" = "bash" ] && [ "$2" = "-c" ]; then
  # Already formatted correctly, execute as is
  exec "$@"
elif [ $# -gt 0 ] && [ "$1" = "-c" ]; then
  # If first argument is -c, prepend bash
  exec bash "$@"
else
  # Otherwise execute normally
  exec "$@"
fi