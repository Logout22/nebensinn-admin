#!/bin/bash

set -o errexit
set -o nounset

source venv/bin/activate
pip install -r requirements.txt
ansible-galaxy install -r roles/requirements.yml
if [[ -z ${1+x} ]]; then
    playbook=site.yml
else
    playbook=$1
    shift
fi
ansible-playbook -i hosts "$playbook" "$@"
