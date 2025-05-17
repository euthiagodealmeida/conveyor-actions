#!/bin/sh

# This makes sdk available to any commands that are executed
if [ -f "/root/.sdkman/bin/sdkman-init.sh" ]; then
  . /root/.sdkman/bin/sdkman-init.sh
  echo "SDKMAN sourced successfully"
fi

# Print arguments received
printf 'Received %d args:' "$#"
printf " '%s'" "$@"
printf '\n'

exec "$@"