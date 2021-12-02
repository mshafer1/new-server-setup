#!/bin/bash -v
set -e

if test -f /usr/bin/run_updates; then
  echo "Update command already stored in /usr/bin/run_updates"
  echo "skipping"
  exit 0
fi

ln -s /root/scripts/run_updates.sh /usr/bin/run_updates

# at 2 AM (server time) every monday, check if it is the first monday of month, if so, run updates (and log)
line='0 2 * * 1 [ `date "+\%m"` != `date "+\%m" -d "1 week ago"` ] && run_updates >> /var/log/updates_log'
# add that line to the root crontab
(crontab -l -u root; echo "$line" ) | crontab -u root -
