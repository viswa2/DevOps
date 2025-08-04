#!/bin/bash
set -x #Debug mode
SERVICES=("apache2" "nginx")

for SERVICE in "$SERVICES[@]"; do
  if ! systemctl is-active --quiet "$SERVICE"; then
  echo "$SERVICE is not running, starting it..."
  systemctl start "$SERVICE"
 echo "$SERVICE is started" 
else
 echo "$SERVICE is running."
  fi
done