#!/bin/sh
# systemctl stop ghost-instance
. roles/ansible-role-ghost-backup/venv/bin/activate
# TODO remove -i option
ansible-playbook \
    -e "aws_access_key=$AWS_ACCESS_KEY_ID" \
    -e "aws_secret_key=$AWS_SECRET_ACCESS_KEY" \
    -i "backup_ghost_hosts" \
    backup_ghost.yml
# systemctl start ghost-instance
