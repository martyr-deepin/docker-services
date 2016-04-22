#!/bin/bash -e

cron_job(){
    cron_file='/var/www/dtk-doc/cron_job'

    if [ ! -f "$cron_file" ]; then
        echo '*/15 * * * * bash -c "cd /var/www/dtk-doc && doxygen"' > $cron_file
    fi

    crontab $cron_file
}

cron_job
service php5-fpm start

nginx -g 'daemon off;'
