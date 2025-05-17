#!/bin/sh

# Print arguments received
printf 'Received %d args:' "$#"
printf " '%s'" "$@"
printf '\n'

exec "$@"