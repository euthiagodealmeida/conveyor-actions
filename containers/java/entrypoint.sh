#!/bin/bash

if [ -d "/github/workspace" ]; then
  sudo chown -R conveyorci:conveyorci /github/workspace
  echo "Fixed permissions for /github/workspace"
fi

exec "$@"