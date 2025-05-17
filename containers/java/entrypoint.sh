#!/bin/bash

# Source SDKMAN
if [ -f "/root/.sdkman/bin/sdkman-init.sh" ]; then
  source /root/.sdkman/bin/sdkman-init.sh
  echo "SDKMAN sourced successfully"
fi

# Print arguments received
printf 'Received %d args:' "$#"
printf " '%s'" "$@"
printf '\n'

exec "$@"