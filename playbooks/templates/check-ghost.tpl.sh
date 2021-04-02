#!/bin/sh
UPDATED_GHOST_FILE=/root/updated_ghost
GHOST_UPDATE_LOG=/root/ghost_update_$(date "+%Y%m%d-%H%M%S").log

fetch_ghost_home_page() {
    RETRY_COUNT=3
    for i in $(seq 1 $RETRY_COUNT); do
        if curl -I -q "{{local_ghost_address}}" 2>/dev/null | head -n1 | grep -q 200; then
            return 0
        fi
        if [ $i -lt $RETRY_COUNT ]; then
            sleep 10
        fi
    done
    return 1
}

force_update_ghost() {
    set -o errexit
    systemctl stop ghost-instance
    su -lc 'cd /var/www/ghost && ghost update --force' ghost > "$GHOST_UPDATE_LOG" 2>&1
    systemctl start ghost-instance
    touch $UPDATED_GHOST_FILE
    set +o errexit
}

if fetch_ghost_home_page; then
    rm -f $UPDATED_GHOST_FILE
else
    if ! [ -f $UPDATED_GHOST_FILE ]; then
        force_update_ghost
        if fetch_ghost_home_page; then
            exit
        fi
    fi
    echo "Error: unable to reach Ghost home page!" | mail -s "Book club Ghost instance" webmaster
fi
