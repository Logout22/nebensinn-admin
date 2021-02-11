#!/bin/bash

set -o errexit
set -o nounset

source venv/bin/activate
pip install -r requirements.txt
ansible-galaxy install -r roles/requirements.yml
playbook=${1:-site.yml}
shift
ansible-playbook -i hosts "$playbook" "$@"
