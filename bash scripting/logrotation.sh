#!/bin/bash
set -x
LOG_DIR="/var/log/syslog"
ARCHIVE_DIR="/var/log/archive"
mkdir -p "$ARCHIVE_DIR"

find "$LOG_DIR" -name "*.log" -type f -mtime +7 -exec {} gzip \; -exec mv {} .gz "$ARCHIVE_DIR" \;
echo "sucessfully find the logs and moved into archive directory"