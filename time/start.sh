#!/bin/sh

echo "0  *  *  *  *    /time/cron.sh" > /etc/crontabs/root
crond -b
sh /time/cron.sh &