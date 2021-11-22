#!/bin/bash -v
set -e
log_file=/var/log/updates.log
apt-get update >> $log_file
apt-get upgrade -y >> $log_file
if test -f /var/run/reboot-required; then
  reboot >> $log_file
fi
