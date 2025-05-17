#!/bin/sh

# Making sdkman available for root user
echo "source /root/.sdkman/bin/sdkman-init.sh" >> /root/.bashrc

# Print arguments received
printf 'Received %d args:' "$#"
printf " '%s'" "$@"
printf '\n'

exec "$@"