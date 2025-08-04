#!/bin/bash
set -e
set -x
SERVICE="apache2"

if ! systemctl is-active --quiet "$SERVICE"
   then	
   echo "$SERVICE" is not running
   echo starting the "$SERVICE" service
   sudo systemctl start "$SERVICE"
   echo sucessfully started the "$SERVICE" service
fi